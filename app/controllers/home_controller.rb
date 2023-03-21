class HomeController < ApplicationController
  require 'rubygems'
  require 'pry'
  def index
    @STACK = stack_connection
  end
end
