class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:email]) or user= User.find_by(nickname: params[:nickname])
    
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id #쿠키생성
      
      redirect_to contents_path
    else
      flash[:alert] ='이메일(닉네임) 혹은 비밀번호가 잘못되었습니다'
      render 'new'
      
      
    end
  end
  
  def destroy
    session.delete(:user_id)
    @current_user = nil
    
    redirect_to contents_path
    

    
  end
end
