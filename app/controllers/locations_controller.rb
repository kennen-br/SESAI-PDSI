class LocationsController < ApplicationController
  respond_to :json

  def villages
    results = InvestmentVillage
              .where('name ILIKE ?', "%#{params[:term]}%")
              .order(:name)
              .limit(100)

    render json: results.map { |v| { id: v.id, name: v.name } }
  end

  def cities
    results = City
              .where('city ILIKE ?', "%#{params[:term]}%")
              .order(:city)
              .limit(100)

    render json: results.map { |v| { id: v.id, city: v.city } }
  end
end
