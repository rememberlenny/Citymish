class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    Project.create(project_params)

  end

  def show
    @project = Project.find(params[:id])
    @user = User.find(@project.user_id)
  end

  private
  def project_params
    params.require(:project).permit(:projectImage, :projectTitle, :category, :shortBlurb, :projectLocation, :collectionDuration, :participationGoal, :projectVideo, :projectDescription, :risksChallenges)
  end

end
