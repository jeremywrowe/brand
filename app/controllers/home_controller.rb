# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @resume_content = ResumeContent.new

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: @resume_content.avatar.name, template: 'home/index.html.erb', layout: 'application.html.erb'
      end
    end
  end
end
