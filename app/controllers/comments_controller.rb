class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], item_id: comment_params[:item_id], user_id: current_user.id)
    reload_comments
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(item_id: params[:item_id])
  end

  def reload_comments
    @item = Item.friendly.find(params[:item_id])
    redirect_to "/items/#{@item.random}"
  end
end
