class AboutUsController < ApplicationController
  def index
    response = About::fetchAbout
    @home = response.data.all_page.to_h
  end
end
