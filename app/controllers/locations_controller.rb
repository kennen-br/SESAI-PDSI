class LocationsController < ApplicationController
  respond_to :json

  def villages
    results = InvestmentVillage
              .where('name ILIKE ?', "%#{params[:term]}%")
              .order(:name)
              .limit(100)

    render json: results.map { |v| { id: v.id, name: v.name } }
  end
end
