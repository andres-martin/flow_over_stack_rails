class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_commentable, only: :create

    def create
        @comment = @commentable.comments.new(comment_params)
        # @comment.user = current_user
        if @comment.save
            flash[:info] = "Comment created"
            redirect_to @commentable            
        else
            # validate how question is obtained
            flash[:danger] = "Comment " + @comment.errors[:content][0]
            # redirect_to question
            redirect_to [@comment.commentable] 
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
