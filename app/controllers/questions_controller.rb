class QuestionsController < ApplicationController
  def index
    @questions = Question.order('position desc')
  end

  def new
    @question = Question.new

    render layout: false
  end

  def create
    @question = Question.create(question_params)

    redirect_to :back
  end

  private

  def question_params
    params.require(:question).permit(:body, :position)
  end
end
