# frozen_string_literal: true

class AnswersController < ApplicationController
 
  # def create
  #   question = Question.find(params[:question_id])
  #   if question.answers.create(answers_params)
  #     flash[:info] = 'Answer created'
  #     redirect_to question
  #   else
  #     render :question
  #   end
  # end

  def create
    question = Question.find(params[:question_id])
    answer = question.answers.create(answers_params)
    if answer.save
      flash[:info] = 'Answer created'
      redirect_to question
    else
      flash[:alert] = "Answer can't be empty"
      redirect_to question
    end  
  end
  private

  def answers_params
    params.require(:answer).permit(:content).merge(user: current_user)
  end
end
