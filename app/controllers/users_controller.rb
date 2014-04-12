class UsersController < ApplicationController
  before_filter :require_current_user!, :only => [:show]
  before_filter :require_no_current_user!, :only => [:create, :new]
<<<<<<< HEAD
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      self.current_user = @user
      flash[:success] = ["Hurray! You've successuly signed up to Zenpay!!"]
=======

  def index
    @users = User.all
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      self.current_user = @user
      flash[:success] = ["Hooray! You've successfully signed up to Zenpay!!"]
>>>>>>> 50d47057dd96b7af58939d6e12e47285a04fbe22
      redirect_to root_url
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to root_url
    end
  end
  
  def edit
    @user = User.find(params[:id])
    render :edit
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
<<<<<<< HEAD
      flash[:success] = ["You've successfully updated your profile!!"]
=======
      flash[:success] = ["You've successfully updated your profile!"]
>>>>>>> 50d47057dd96b7af58939d6e12e47285a04fbe22
      redirect_to user_url(@user)
    else
      flash[:danger] = @user.errors.full_messages
      redirect_to user_url(@user)
    end
  end
<<<<<<< HEAD
  
  def destroy
    
=======

  def new
    @user = User.new
    render :new
  end

  def show
    if params.include?(:id)
      @user = User.find(params[:id])
    end
    render :show
>>>>>>> 50d47057dd96b7af58939d6e12e47285a04fbe22
  end
end
