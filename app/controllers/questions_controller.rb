# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy upvote downvote score]
  before_action :authenticate_user!, except: %i[index show]
  # GET /questions
  # GET /questions.json
  def index
    unless !params[:q]
      @questions = Question.where('title LIKE ?', "%#{params[:q]}%")
    else
      @questions = Question.all.order('created_at DESC')  
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show; end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit; end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user = current_user
    if @question.save
      flash[:success] = 'Question was successfully created.'
      redirect_to @question
    else
      render :new
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    if @question.update(question_params)
      flash[:info] = 'Question successfully updated.'
      redirect_to @question
    else
      render :edit
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    flash[:info] = 'Question was successfully destroyed.'
    redirect_to questions_url
  end

  def upvote
    @question.upvote_by current_user
    redirect_to root_path
  end

  def downvote
    @question.downvote_by current_user
    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:title, :content, :q)
  end
end 
