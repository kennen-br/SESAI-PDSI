class CostsController < ApplicationController
  before_action :cost, only: [:show, :edit, :update, :destroy]

  #GET /costs/index
  def index
  	@costs = Cost.all
  end

  #GET /costs/edit
  def edit
  end

  #GET /costs/new
  def new
  end

  #GET /costs/1
  def show
  end
end
