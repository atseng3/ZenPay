class SessionsController < ApplicationController
  before_filter :require_current_user!, :only => [:destroy]
  
  def new
    render :new
  end
  
  def create
    user = User.find_by_credentials(
      params[:user][:email]
      params[:user][:password]
    )
    
    if user.nil?
      flash[:danger] = ["Credentials were wrong"]
      redirect_to root_url
    else
      self.current_user = user
      flash[:success] = ["Successfully logged in as " + user.f_name + " " + user.l_name]
      redirect_to root_url
    end
  end
  
  def destroy
    logout_current_user!
    flash[:success] = ["Successfully logged out!!"]
    redirect_to root_url
  end
end
