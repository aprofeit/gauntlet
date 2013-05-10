class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def new
    @person = Person.new

    render layout: false
  end

  def create
    @person = Person.create(person_params)

    redirect_to :back
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :hire_date)
  end
end
