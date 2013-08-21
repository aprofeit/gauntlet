class PeopleController < ApplicationController
  before_filter :load_person, only: [:edit, :update, :destroy]

  def index
    @people = Person.includes(todos: :objective).order('hire_date asc')
  end

  def show
    @person = Person.includes(:questions).find(params[:id])
  end

  def new
    @person = Person.new

    render layout: false
  end

  def edit
    render layout: false
  end

  def update
    @person.update_attributes(person_params)

    redirect_to :back
  end

  def create
    @person = Person.create(person_params)

    redirect_to :back
  end

  def destroy
    @person.destroy

    redirect_to :back
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :hire_date)
  end

  def load_person
    @person = Person.find(params[:id])
  end
end
