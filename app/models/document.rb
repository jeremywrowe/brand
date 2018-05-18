require 'yaml'

class Document
  def initialize(data_path = Rails.root.join('app', 'data', 'resume.yml'))
    @data_path = data_path
    @data = YAML.load_file(data_path)
  end

  def experiences
    @experiences ||= @data['experiences']
      .map { |experience| Experience.new(*experience.values_at('company', 'title', 'start_date', 'end_date', 'description')) }
  end

  def avatar
    @avatar ||= Avatar.new(@data['avatar'] || {})
  end

  def contact_locations
    @contact_locations ||= @data.fetch('contact_locations', [])
      .map { |contact_location| ContactLocation.new(contact_location) }
  end
end
