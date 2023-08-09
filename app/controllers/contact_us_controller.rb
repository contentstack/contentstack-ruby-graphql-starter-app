class ContactUsController < ApplicationController
  include Contact
  def index
    response = Contact::fetchContact
   @home = response.data.all_page.to_h
  end
end
