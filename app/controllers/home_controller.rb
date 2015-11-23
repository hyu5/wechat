class HomeController < ApplicationController
  def index
    if params[:search]
      @users1 = User.where.not(id: current_user.friends.map(&:id))
      @users = @users1.where.not(id: current_user.id).where("email LIKE ?", "%#{params[:search]}%")
    else
      @users1 = User.where.not(id: current_user.friends.map(&:id))
      @users = @users1.where.not(id: current_user.id)
    end
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
    redirect_to "/"
  end

  def user_params
    params.require(:user).permit(:FirstName, :LastName, :Phone, :DateOfBirth)
  end

end
