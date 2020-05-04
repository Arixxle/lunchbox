class UsersController < ApplicationController
  skip_before_action :check_login

  def login
    @user = User.new
  end
  def sign_in
    #查資料庫是否有此使用者
    user = User.find_by(email: user_params[:email],
                        password: user_params[:password])
    # 上面這段會拿輸入的mail password 去資料庫查找，有的話就會把資料庫資料放到user
    if user
      session[:ccc9527] = user.id
      #如果有，就把使用者資料email存到session(登入)
      redirect_to root_path
    else
      redirect_to login_path
    end
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
