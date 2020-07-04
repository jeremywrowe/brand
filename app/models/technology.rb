# frozen_string_literal: true

class Technology
  include DeviconMapping
  attr_reader :display, :level, :colored, :name

  def initialize(name, display, icon, level, colored = false)
    @name = name
    @display = display
    @icon = icon
    @level = level
    @character = character
    @colored = colored
  end

  def class_name
    colored ? [@icon, 'colored'].join(' ') : @icon
  end

  def character
    DEVICON_MAPPING[@icon]
  end

  def color
    COLOR_MAPPING.fetch(@name, '222222')
  end

  def self.lookup(name)
    KNOWN_ICONS[name]
  end

  COLOR_MAPPING = {
    'react' => '209CEE',
    'rails' => 'FF3860',
    'ruby' => 'FF3860',
    'oracle' => 'EA1B22',
    'java' => '5281A0',
    'javascript' => 'FFDD57',
    'dotnet' => '209CEE',
    'cucumber' => '23D160',
    'mysql' => '209CEE',
    'c' => '209CEE',
    'cplusplus' => 'FF3860',
    'postgresql' => '209CEE',
    'docker' => '222222',
  }.freeze

  KNOWN_ICONS = {
    swift: Technology.new('swift', 'Swift', 'swift-plain', 'white', true),
    elixir: Technology.new('erlang', 'Elixir', 'erlang-plain', 'dark', true),
    c: Technology.new('c', 'C', 'c-plain', 'info'),
    cucumber: Technology.new('cucumber', 'Cucumber', 'cucumber-plain', 'success'),
    cplusplus: Technology.new('cplusplus', 'C++', 'cplusplus-plain', 'danger'),
    d3: Technology.new('d3', 'D3.js', 'd3js-plain', 'white', true),
    docker: Technology.new('docker', 'Docker', 'docker-plain', 'dark', true),
    dotnet: Technology.new('dot-net', '.net', 'dot-net-plain-wordmark', 'white', true),
    java: Technology.new('java', 'Java', 'java-plain', 'white', true),
    javascript: Technology.new('javascript', 'Javascript', 'javascript-plain', 'warning'),
    mysql: Technology.new('mysql', 'MySQL', 'mysql-plain', 'dark'),
    postgresql: Technology.new('postgresql', 'PostgreSQL', 'postgresql-plain', 'info'),
    rails: Technology.new('rails', 'Rails', 'rails-plain', 'white', true),
    react: Technology.new('react', 'React', 'react-original', 'white', true),
    ruby: Technology.new('ruby', 'Ruby', 'ruby-plain', 'danger')
  }.with_indifferent_access.freeze
end
