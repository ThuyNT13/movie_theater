module ApplicationHelper
  def head_title(page_title="")
    base_title = "CineMix"
    if !page_title.empty?
      "#{base_title} - #{page_title}"
    else
      base_title
    end
  end
end
