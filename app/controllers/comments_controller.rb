class CommentsController < ApplicationController
  def create
    @content = Content.find(params[:content_id])
    @comment = @content.comments.new(comment_params)
    @comment.save
    
    redirect_to @content
    
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
  
end
