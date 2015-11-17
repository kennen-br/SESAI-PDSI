class SesaiPeopleController < ApplicationController
  before_action :check_sesai_central_actions
  before_action :set_person,      only: [:edit, :update, :destroy]
  before_action :validate_person, only: [:edit, :update, :destroy]

  def index
    @people = Person.sesai_people.order(:name)
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def create
    @person                   = Person.new(person_params)
    @person.is_sesai_central  = true

    if @person.save
      redirect_to sesai_people_url, notice: 'Pessoa cadastrada com sucesso.'
    else
      render :new
    end
  end

  def update
    if @person.update(person_params)
      redirect_to sesai_people_url, notice: 'Pessoa atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @person.destroy
    redirect_to sesai_people_url, notice: 'Pessoa excluída com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Check if person to edit, update or destroy belongs to current dsei
    def validate_person
      redirect_to sesai_people_path, flash: { error: 'A pessoa que você esta tentando alterar não pertence à SESAI Central' } unless @person.is_sesai_central
    end

    # Only allow a trusted parameter "white list" through.
    def person_params
      params.require(:person).permit(:name, :location, :bond)
    end
end
