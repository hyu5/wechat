class HomeController < ApplicationController
  def index
    if user_signed_in?
      if params[:search]
        @users1 = User.where.not(id: current_user.friends.map(&:id))
        @users = @users1.where.not(id: current_user.id).where("email LIKE ?", "%#{params[:search]}%")
      else
        @users1 = User.where.not(id: current_user.friends.map(&:id))
        @users = @users1.where.not(id: current_user.id)
      end
      @c_user = User.where(id: current_user.id)
    end
  end


  def destroy
    @user = User.find_by_id(params[:id])
    if @user.destroy
      flash[:notice] = "The user has been deleted successfully."
      redirect_to :back
    else
      flash[:error] = "Unable to delete user."
      redirect_to :back
    end
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

  def create_group
    if request.post?
      id = params[:userid]
      user = User.find(id)
      group = Group.new
      group.name = params[:groupname]
      group.users << user
      group.save
      redirect_to "/"
    end
    if request.get?
      @userid = params[:userid]
    end
  end

  def send_message
    if request.post?
      message = Message.new
      message.sender_id = params[:userid]
      message.body = params[:message]

      receiver_users = params[:tousers].to_s.split(";")
      receiver_users.each do |receiver|
        message.users << User.find(receiver)
      end

      receiver_groups = params[:togroups].to_s.split(";")
      receiver_groups.each do|group|
        message.groups << Group.find(group)
      end
      message.save
      redirect_to "/"
    end
    if request.get?
      @userid = params[:userid].to_s
    end
  end

end
