class PostsController < ApplicationController
  def index
    @moments = Moment.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    @friend_moments = Moment.where(user_id: params[:index]).order(created_at: :desc)
    @friend = User.where(id: params[:index])
  end

  def new
    @moment = Moment.new
  end

  def create
    @moment = Moment.new(moment_params)
    @moment.user_id = current_user.id
    if (@moment.save)
      flash[:notice]="The moment was created successfully!"
      redirect_to :action=>"index"
    else
      render :action=>"new"
    end
  end

  def delete
    moment = Moment.find(params[:id])
    moment.destroy
    flash[:notice]="The moment was deleted successfully!"
    redirect_to :action=>"index"
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_moment
    @moment = Moment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def moment_params
    params.require(:moment).permit(:message, :user_id)
  end
end
