class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.image = Image.find(params[:image_id])
    if @comment.save
      flash[:accepted] = "Comment Added"
      redirect_to image_path(@comment.image)
    else
      flash[:errors] = @comment.errors.full_messages.join(". ")
      redirect_to image_path(@comment.image)
    end
  end

  protected

  def comment_params
    list = [:body]
    params.require(:comment).permit(list)
  end
end
