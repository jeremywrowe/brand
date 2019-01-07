# frozen_string_literal: true

class ContactLocation
  attr_reader :heading, :link, :icon, :unicode

  def initialize(contact_location)
    @heading = contact_location['heading']
    @link = contact_location['link']
    @icon = contact_location['icon']
    @unicode = contact_location['unicode']
    @email = contact_location['email']
  end

  def email?
    @email
  end
end
