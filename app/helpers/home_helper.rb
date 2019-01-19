module HomeHelper
  def tech_tag(technology)
    content_tag(:span, class: [:tag, "is-#{technology.level}"]) do
      concat content_tag(:i, '', class: "devicon-#{technology.class_name}")
      concat '&nbsp;'.html_safe
      concat technology.display
    end
  end
end
