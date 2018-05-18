class ContactLocation
  attr_reader :heading, :link, :icon

  def initialize(contact_location)
    @heading = contact_location['heading']
    @link = contact_location['link']
    @icon = contact_location['icon']
  end
end
