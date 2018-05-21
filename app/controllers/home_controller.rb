# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @resume_content = ResumeContent.new
  end
end
