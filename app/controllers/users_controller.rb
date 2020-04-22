class UsersController < ApplicationController
  def login
    
  end
  def signup
    
  end
  def registration
    user = params[:user]
    if user[:password] == user[:password_confirm]
      #新增使用者
      clean_user = params.require(:user).permit(:email, :password, :password_confirm) #strong parameters
      u = User.new(clean_user) #上段精簡，把整個hash塞給一個變數
      if u.save 
        #若成功
        #幫登入
      redirect_to "/"
      else 
        #若失敗
      redirect_to "/sign_up"
      end
    else
      redirect_to "/sign_up"
    end
  end
end
