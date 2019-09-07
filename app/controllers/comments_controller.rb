class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            flash[:info] = "Comment created"
            redirect_to [@comment.commentable]            
        else
            # validate how question is obtained
            flash[:danger] = "Comment " + @comment.errors[:content][0]
            # redirect_to question
            redirect_to [@comment.commentable] 
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:text, :commentable_id, :commentable_type)
    end
end
