class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    Project.create(project_params)
  end

  private
  def project_params
    params.require(:project).permit(:projectImage, :projectTitle, :category, :shortBlurb, :projectLocation, :collectionDuration, :participationGoal, :projectVideo, :projectDescription, :risksChallenges)
  end

end
