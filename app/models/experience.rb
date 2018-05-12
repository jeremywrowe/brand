class Experience
  attr_reader :company, :title, :start_date, :end_date, :description

  def initialize(company, title, start_date, end_date, description)
    @company = company
    @title = title
    @start_date = start_date
    @end_date = end_date
    @description = description
  end

  def duration
    "#{start_date} - #{end_date || 'Present'}"
  end
end
