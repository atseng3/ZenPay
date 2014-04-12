class SessionsController < ApplicationController
<<<<<<< HEAD
  before_filter :require_current_user!, :only => [:destroy]
  
  def new
    render :new
  end
  
  def create
    user = User.find_by_credentials(
      params[:user][:email]
      params[:user][:password]
    )
    
=======
  # before_filter :require_no_current_user!, :only => [:create, :new]
  before_filter :require_current_user!, :only => [:destroy]

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

>>>>>>> 50d47057dd96b7af58939d6e12e47285a04fbe22
    if user.nil?
      flash[:danger] = ["Credentials were wrong"]
      redirect_to root_url
    else
      self.current_user = user
      flash[:success] = ["Successfully logged in as " + user.f_name + " " + user.l_name]
      redirect_to root_url
    end
  end
<<<<<<< HEAD
  
  def destroy
    logout_current_user!
    flash[:success] = ["Successfully logged out!!"]
    redirect_to root_url
  end
=======

  def destroy
    logout_current_user!
    flash[:success] = ["Successfully logged out!"]
    redirect_to root_url
  end

  def new
    render :new
  end
>>>>>>> 50d47057dd96b7af58939d6e12e47285a04fbe22
end
