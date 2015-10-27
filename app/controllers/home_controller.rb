class HomeController < ApplicationController
  def index
  end

  def admin
  end

  def edit_profile
    email = params[:email]
    @user = User.find_by_email(email)

  end

  def update
    @user = User.find_by_email(params[:user][:email])
    @user.update_attributes(user_params)
    #@user = User.find_by_email(params[:email])
    #@user.FirstName = params[:FirstName]
    #@user.LastName = params[:LastName]
    #@user.Phone = params[:Phone]
    #@user.DateOfBirth = params[:DateOfBirth]
    #@user.save
  end

  def user_params
    params.require(:user).permit(:FirstName, :LastName, :Phone, :DateOfBirth)
  end

end
