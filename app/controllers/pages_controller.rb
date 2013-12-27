class PagesController < ApplicationController

  def index
    if signed_in?
      @mission  = current_user.missions.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
    @mission = current_user.missions.build if signed_in?
  end

end

