# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :icons do
  desc "Clone dev icons"
  task :clone do
    puts `git clone https://github.com/konpa/devicon.git`
  end

  desc "Update dev icons"
  task :update do
    cd 'devicon' do
      puts `git pull`
    end
  end

  desc "Copy dev icons to app/views/icons"
  task :copy do
    mkdir_p "app/views/icons"
    Dir["./devicon/icons/**/*-plain.svg"].each do |icon|
      dest = File.join("app", "views", "icons", File.basename(icon).sub("-plain.svg", ".html.erb"))
      cp icon, dest
    end
  end
end
