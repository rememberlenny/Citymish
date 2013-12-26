class MissionsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @mission = current_user.missions.build(mission_params)
    if @mission.save
      flash[:success] = "Mission created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @mission.destroy
    redirect_to root_url
  end

  private

    def mission_params
      params.require(:mission).permit(:content)
    end

    def correct_user
      @mission = current_user.missions.find_by(id: params[:id])
      redirect_to root_url if @mission.nil?
    end
end
