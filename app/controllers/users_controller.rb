class UsersController < ApplicationController
def show
    @user = User.find(params[:id])
@title = @user.name
  end

  def new
    @user = User.new
    @title = "Sign up"
  end

def create
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.
flash[:success] = "Welcome to the Sample App!"
redirect_to @user   
 else
      @title = "Sign up"
# exercise 8 start
@user.password = ""     
@user.password_confirmation = ""
# exercise 8 end
 render 'new'
    end
end
end
