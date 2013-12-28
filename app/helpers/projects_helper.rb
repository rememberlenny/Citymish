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


  def bitly_shorten
    current_project_url = request.original_url
    Bitly.use_api_version_3
    bitly = Bitly.new( ENV["bitlylogin"], ENV["bitlyapikey"] )
    bitly_shortened_url = bitly.shorten(current_project_url).short_url
    return bitly_shortened_url
  end

end
