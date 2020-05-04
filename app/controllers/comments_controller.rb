class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @item = Item.find(params[:item_id])
    @comment = @item.comments.build(comment_params.merge(user: current_user))
    if @comment.save
      
    else
      render 'items/show', alert: 'Not Ok!'
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
