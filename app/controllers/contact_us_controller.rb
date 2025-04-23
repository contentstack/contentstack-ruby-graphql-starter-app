class ContactUsController < ApplicationController
  include Contact
  def index
    response = fetchContact
   @home = response.data.all_page.to_h
  end
end
