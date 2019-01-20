# frozen_string_literal: true

class Devicon
  OUTPUT_PATH = 'devicon_mapping.rb'
  CSS_PATH = File.expand_path('../vendor/assets/fonts/devicon.css', __dir__).freeze
  ICON_START_PATTERN = /\.devicon-(?<value>.*?):before\s*(?<ending>[,|{])/.freeze
  CONTENT_PATTERN = /\s*content:\s*"\\e(?<value>\w+)/.freeze
  ICON_END_PATTERN = /\s*}/.freeze

  def initialize
    @entries = []
    @entry = IconEntry.new
  end

  def parse
    File.readlines(CSS_PATH).each do |line|
      state, match = parse_state(line)
      @entry.name = match['value'] if state == :start
      @entry.content = match['value'] if state == :content
      finalize_entry if state == :end
    end

    File.open(OUTPUT_PATH, 'w') do |file|
      file.puts 'module DeviconMapping'
      file.puts '  DEVICON_MAPPING = {'
      Hash[@entries.flat_map(&:to_a)].each do |key, value|
        file.puts %(    "#{key}" => "\\ue#{value}",)
      end
      file.puts '  }.freeze'
      file.puts 'end'
    end
  end

  def parse_state(line)
    start_state = line.match(ICON_START_PATTERN)
    return [:start, start_state] if start_state

    content_state = line.match(CONTENT_PATTERN)
    return [:content, content_state] if content_state

    end_state = line.match(ICON_END_PATTERN)
    return [:end, end_state] if end_state

    [:skip, nil]
  end

  def finalize_entry
    @entries << @entry
    @entry = IconEntry.new
  end

  def self.parse
    new.parse
  end

  class IconEntry
    attr_reader :names, :content

    def initialize
      @names = []
    end

    def name=(value)
      @names << value
    end

    attr_writer :content

    def to_a(*)
      names.map { |name| [name, @content] }
    end
  end
end

Devicon.parse
