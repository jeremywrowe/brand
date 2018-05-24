# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @resume_content = ResumeContent.new
    pdf_resume = Pdf::Resume.new(@resume_content)

    respond_to do |format|
      format.html
      format.pdf { send_data pdf_resume.render, disposition: :inline, filename: "#{@resume_content.avatar.name}.pdf", type: 'application/pdf' }
    end
  end
end
