module ProjectsHelper

  def lastDay
    endingDay = (@project.created_at+@project.collectionDuration.day)
    return endingDay
  end

  def daysRemaining
    endingDay = (@project.created_at+@project.collectionDuration.day)
    daysRemaining = ((endingDay - Time.now)/86400).floor
    return daysRemaining
  end

end
