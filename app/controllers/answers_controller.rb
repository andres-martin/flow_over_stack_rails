# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authenticate_user!
  def create
    question = Question.find(params[:question_id])
    answer = question.answers.create(answers_params)
    if answer.save
      flash[:info] = 'Answer created'
      redirect_to question
    else
      # flash[:danger] = "Answer can't be blank"
      flash[:danger] = "Answer " + answer.errors[:content][0]
      redirect_to question
    end  
  end
  
  private

  def answers_params
    params.require(:answer).permit(:content).merge(user: current_user)
  end
end
