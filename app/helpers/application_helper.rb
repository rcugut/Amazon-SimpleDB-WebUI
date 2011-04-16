module ApplicationHelper

  def page_html_title

    base_title = "Amazon SimpleDB WebUI"

    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end

  end

  
end
