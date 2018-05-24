# frozen_string_literal: true

Rails.application.routes.draw do
  get '/resume', to: 'home#index', as: :resume
  root 'home#index'
end
