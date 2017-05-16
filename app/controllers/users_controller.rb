class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      login(@user)
      
      
      redirect_to contents_path
    else
      render 'new'
      
    end
  end
  
  def edit
    current_user.add_role :admin
    redirect_to contents_path
  end
  
  def delete
    current_user.add_role :moder
    redirect_to contents_path
    
  end
 
  
  
  
  
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname)
  end
  
end
