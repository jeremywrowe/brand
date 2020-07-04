# frozen_string_literal: true

module HomeHelper
  def tech_tag(technology)
    content_tag(:div, class: ["p-1 flex text-center justify-between items-center inline-block bg-white border border-gray-300 rounded-lg px-3 text-xs mr-2"]) do
      concat render(template: "icons/#{technology.name}").html_safe
      concat "<div class='pl-4 font-bold'>#{technology.display}</div>".html_safe
    end
  end
end
