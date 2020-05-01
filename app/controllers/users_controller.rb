class UsersController < ApplicationController
  def login
  end
  def logout
    session[:ccc9527] = nil
    redirect_to root_path
  end
  def signup
    @user = User.new
  end
  def registration
    #新增使用者
    @user = User.new(user_params) #上段精簡，把整個hash塞給一個變數
    if @user.save 
      #若成功
      #幫登入
      session[:ccc9527] = @user.email
      redirect_to root_path
    else 
      #若失敗
    render :signup
    end
  end


  private
  def user_params
    params.require(:user).permit(:email, 
                                 :password, 
                                 :password_confirmation) #strong parameters    
  end
end
