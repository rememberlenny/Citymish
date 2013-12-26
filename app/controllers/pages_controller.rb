class PagesController < ApplicationController
  def index
    @mission = current_user.missions.build if signed_in?
  end

end
