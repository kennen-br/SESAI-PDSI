class PeopleController < ApplicationController
  attr_accessor :dsei, :person
  def create
    @dsei = current_user.pdsi.dsei
    begin
      validate_person

      render json: { status: true, id: @person.id, name: @person.name }
    rescue => e
      render json: { status: false, message: e.message }
    end
  end

  def search
    results = People.where("name ILIKE ?", "%#{params[:query]}%").order(:name).limit(100)

    render json: results.map{ |person| { id: person.id, name: person.name, location: person.location }}
  end

private
  def validate_person
    fail 'Nome da pessoa não informado' unless params.key?(:name)

    @person = @dsei.people.where(name: params[:name]).first_or_initialize
    return unless @person.id.nil?

    fail "Nome #{@person.errors.messages[:name].first}" unless @person.valid?

    @person.save
  end
end
