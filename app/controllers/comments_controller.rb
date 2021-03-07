class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comments_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
      # redirect_to "/items/#{comment.item.id}"
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
