class PostsController < ApplicationController
  def index
    @moments = Moment.all.order(created_at: :desc)
  end

  def new

  end

  def create
    moment = Moment.new(moment_params)
    if (moment.save)
      flash[:notice]="The moment was created successfully!"
      redirect_to :action=>"index"
    else
      flash[:notice]="Error Creating, try again!"
      redirect_to :action=>"index"
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
    params.require(:moment).permit(:message)
  end
end
