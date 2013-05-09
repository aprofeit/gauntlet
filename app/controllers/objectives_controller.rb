class ObjectivesController < ApplicationController
  def index
    @objectives = Objective.all
  end

  def new
    @objective = Objective.new

    render layout: false
  end

  def create
    @objective = Objective.create(objective_params)

    redirect_to :back
  end

  private

  def objective_params
    params.require(:objective).permit(:title)
  end
end
