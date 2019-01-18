# frozen_string_literal: true

require 'yaml'

class ResumeContent
  def initialize(data_path = Rails.root.join('app', 'data', 'resume.yml'))
    @data_path = data_path
    @data = YAML.load_file(data_path)
  end

  def experiences
    @experiences ||= @data.fetch('experiences', {})
                          .map { |experience| Experience.new(*experience.values_at('company', 'titles', 'start_dates', 'end_dates', 'description', 'technologies')) }
  end

  def avatar
    @avatar ||= Avatar.new(@data['avatar'] || {})
  end

  def contact_locations
    @contact_locations ||= @data.fetch('contact_locations', [])
                                .map { |contact_location| ContactLocation.new(contact_location) }
  end

  def bio
    @bio ||= @data['bio']
  end

  def github_username
    @github_username ||= @data['github_username']
  end
end
