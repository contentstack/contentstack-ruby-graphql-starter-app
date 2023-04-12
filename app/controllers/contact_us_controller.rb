class ContactUsController < ApplicationController
  def index
    response = Contact::fetchContact
   @home = response.data.all_page.to_h
  end
end
