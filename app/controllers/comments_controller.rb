class CommentsController < ApplicationController
  def create
    #寫法1
    @comment = Comment.new(comment_params)
    # @comment.item_id = params[:item_id]
    # @comment.user_id = current_user.id
    
    #寫法2
    # @comment = Comment.new(comment_params,
    #                        item_id: params[:item_id],
    #                        user_id: current_user.id)

    #寫法3（出現錯誤）
    # @item = Item.find(params[:item_id])
    # @comment = current_user.comments.build(comment_params, item: @item)

    #寫法3改
    @item = Item.find(params[:item_id])
    @comment = @item.comments.build(comment_params.merge(user: current_user))
    if @comment.save #會壞 因為model需要content user_id item_id
      redirect_to item_path(params[:item_id]), notice: 'OK!'
    else
      # redirect_to item_path(params[:item_id]), alert: 'Not Ok!'
      render 'items/show', alert: 'Not Ok!'
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
