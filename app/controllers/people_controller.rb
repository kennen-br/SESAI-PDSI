class PeopleController < ApplicationController
  before_action :set_dsei
  before_action :set_person,      only: [:show, :edit, :update, :destroy]
  before_action :validate_person, only: [:edit, :update, :destroy]

  # GET /people
  def index
    @people = @dsei.people.order(:name)
  end

  # GET /people/1
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  def create
    @person       = Person.new(person_params)
    @person.dsei  = @dsei

    if @person.save
      redirect_to people_url, notice: 'Pessoa cadastrada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      redirect_to people_url, notice: 'Pessoa atualizada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
    redirect_to people_url, notice: 'Pessoa excluída com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    def set_dsei
      @dsei   = current_dsei
    end

    # Check if person to edit, update or destroy belongs to current dsei
    def validate_person
      redirect_to people_path, flash: { error: 'A pessoa que você esta tentando alterar não pertence ao seu DSEI!' } if @person.dsei != @dsei
    end

    # Only allow a trusted parameter "white list" through.
    def person_params
      params.require(:person).permit(:dsei_id, :name, :location, :bond)
    end
end
