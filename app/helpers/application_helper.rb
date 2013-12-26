module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Citymission"
    if page_title.empty?
      base_title + " | Collect data with purpose"
    else
      "#{page_title} | #{base_title}"
    end
  end
end
