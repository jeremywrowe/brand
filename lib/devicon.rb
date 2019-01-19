class Devicon
  CSS_PATH = File.expand_path('../vendor/assets/fonts/devicon.css', __dir__)
  ICON_START_PATTERN = /\.devicon-(?<value>.*?):before\s*(?<ending>[,|{])/
  CONTENT_PATTERN = /\s*content:\s*"(?<value>\\\w+)/
  ICON_END_PATTERN = /\s*{/

  def self.parse
    entries = []
    entry = IconEntry.new

    File.readlines(CSS_PATH).each do |line|
      icon_start = line.match(ICON_START_PATTERN)
      content = line.match(CONTENT_PATTERN)
      icon_end = line.match(ICON_END_PATTERN)

      entry.name = icon_start['value'] if icon_start
      entry.content = content['value'] if content

      if icon_end
        entries << entry
        entry = IconEntry.new
      end
    end

    Hash[entries.flat_map(&:to_a)]
  end

  private

  class IconEntry
    attr_reader :names, :content

    def initialize
      @names = []
    end

    def name=(value)
      @names << value
    end

    def content=(value)
      @content = value
    end

    def to_a(*)
      names.map { |name| [name, @content] }
    end
  end
end

puts Devicon.parse.keys.grep /redis/
