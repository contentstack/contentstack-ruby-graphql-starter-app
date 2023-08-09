class HomeController < ApplicationController
  include Home
  def index
    
    response = Home::homeQuery
    @home = response.data.all_page.to_h
  end
end
