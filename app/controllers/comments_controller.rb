class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_commentable
    
    def new
      @comment = Comment.new
    end

    def create
        @comment = @commentable.comments.new(comment_params)
        if @comment.save
            flash[:info] = "Comment created"
            if params[:answer_id]
                redirect_to @commentable.question
            else  
                redirect_to @commentable
            end
        else
            # @errorContent << @comment.errors[:text][0] if @comment.errors.any?
            flash[:danger] = "Comment " + @comment.errors[:text][0]
            if params[:answer_id]
                redirect_to @commentable.question
            else  
                redirect_to @commentable
            end
            # render :errors
            # format.js
            # redirect_to @commentable 
            # render 'create.js.erb'
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:text)
    end

    def find_commentable
        if params[:question_id]
            @commentable = Question.find_by_id(params[:question_id])
        elsif params[:answer_id]
            @commentable = Answer.find_by_id(params[:answer_id])
        end
    end
end
