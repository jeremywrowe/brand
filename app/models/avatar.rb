class Avatar
  attr_reader :url, :name, :blurbs

  def initialize(avatar)
    @url = avatar['url']
    @name = avatar.fetch('name', 'Unknown Person')
    @blurbs = avatar.fetch('blurbs', [])
  end
end
