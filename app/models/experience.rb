class Experience
  attr_reader :company, :titles, :start_dates, :end_dates, :description

  def initialize(company, titles, start_dates, end_dates, description)
    @company = company
    @titles = Array(titles)
    @start_dates = Array(start_dates)
    @end_dates = Array(end_dates)
    @description = description
  end

  def durations
    dates.map do |start_date, end_date|
      "#{start_date} - #{end_date.presence || 'Present'}"
    end
  end

  def dates
    @dates ||= start_dates.zip(end_dates)
  end
end
