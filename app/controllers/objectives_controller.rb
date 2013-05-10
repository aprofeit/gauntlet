class ObjectivesController < ApplicationController
  def index
    @objectives = Objective.order('position')
  end

  def new
    @objective = Objective.new

    render layout: false
  end

  def create
    @objective = Objective.create(objective_params)

    redirect_to :back
  end

  def destroy
    Objective.find(params[:id]).destroy

    redirect_to :back
  end

  def sort
    params[:objective].each_with_index { |id, index| Objective.where(id: id).update_all(position: index + 1) }

    render nothing: true
  end

  private

  def objective_params
    params.require(:objective).permit(:title)
  end
end
