# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @document = Document.new
  end
end
