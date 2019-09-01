# frozen_string_literal: true

class AnswersController < ApplicationController
  def create
    question = Question.find(params[:question_id])
    question.answers.create(answers_params)
    flash[:info] = 'Answer created'
    redirect_to question
  end

  private

  def answers_params
    params.require(:answer).permit(:content).merge(user: current_user)
  end
end
