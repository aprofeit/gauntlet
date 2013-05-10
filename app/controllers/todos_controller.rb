class TodosController < ApplicationController
  before_filter :set_todo

  def show
    @todo = Todo.find(params[:id])
  end

  def complete
    @todo.update_attributes(complete: true)

    render nothing: true
  end

  def uncomplete
    @todo.update_attributes(complete: false)

    render nothing: true
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
