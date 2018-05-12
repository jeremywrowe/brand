require 'yaml'

class Document
  def initialize(data_path = Rails.root.join('app', 'data', 'resume.yml'))
    @data_path = data_path
    @data = YAML.load_file(data_path)
  end

  def experiences
    @experiences ||= @data['experiences']
      .map { |e| Experience.new(e['company'], e['title'], e['start_date'], e['end_date'], e['description']) }
  end
end
