class SessionsController < ApplicationController
  # skip_before_action :set_current_user
  
  def user_params
    params.require(:user).permit(:user_id, :user_first_name, :user_last_name, :email, :password, :password_confirmation, :user_administrator, :user_priority, :user_phone_number)
  end
  
  def new
    # default: render 'new' template
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      cookies.permanent[:session_token]= user.session_token
      flash[:notice]= 'You Have Succesfully Logged in'
      if user.user_administrator == true
        redirect_to administrator_session_path
      end
      else
        redirect_to employee_session_path and return
      end
    else
      flash.now[:warning] = 'Invalid email/password combination'
      redirect_to login_path and return
    end  
  end

#  def show
#    id = params[:id]
#    @user = User.find(id)
#  end
  
  def administrator
    id = params[:user][:id]
    @user = User.find_by_email(params[:session][:email])
  end
  
  def employee
    #id = params[:id]
    @user = User.find_by_email(params[:session][:email])
  end

  def destroy
    cookies.delete(:session_token) 
    @current_user=nil
    flash[:notice]= 'You have logged out'
    redirect_to new_session and return
  end
