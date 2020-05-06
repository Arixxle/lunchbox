class Api::V1::ItemsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # skip_before_action :check_login
  def favorite
    item = Item.find(params[:id]) 
    if item.favorited_by(current_user)
      current_user.items.delete(item)
      render json: {status: 'removed'}
    else
      current_user.items << item
      render json: {status: 'favorited'}
    end
  end
end
