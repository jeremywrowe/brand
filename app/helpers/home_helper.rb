module HomeHelper
  Technology = Struct.new(:name, :icon_class, :tag_type)

  TECHNOLOGIES = {
    c: Technology.new('C', 'c-plain', 'info'),
    cucumber: Technology.new('Cucumber', 'cucumber-plain', 'success'),
    cplusplus: Technology.new('C++', 'cplusplus-plain', 'danger'),
    d3: Technology.new('D3.js', 'd3js-plain colored', 'white'),
    docker: Technology.new('Docker', 'docker-plain colored', 'dark'),
    dotnet: Technology.new('.net', 'dot-net-plain-wordmark colored', 'white'),
    java: Technology.new('Java', 'java-plain colored', 'white'),
    javascript: Technology.new('Javascript', 'javascript-plain', 'warning'),
    mysql: Technology.new('MySQL', 'mysql-plain', 'info'),
    oracle: Technology.new('Oracle', 'oracle-original colored', 'white'),
    postgresql: Technology.new('PostgreSQL', 'postgresql-plain', 'info'),
    rails: Technology.new('Rails', 'rails-plain colored', 'white'),
    react: Technology.new('React', 'react-original colored', 'white'),
    ruby: Technology.new('Ruby', 'ruby-plain', 'danger'),
  }.with_indifferent_access.freeze


  def tech_tag(key:)
    technology = TECHNOLOGIES[key]
    content_tag(:span, class: [:tag, "is-#{technology.tag_type}"]) do
      concat content_tag(:i, '', class: "devicon-#{technology.icon_class}")
      concat '&nbsp;'.html_safe
      concat technology.name
    end
  end
end
