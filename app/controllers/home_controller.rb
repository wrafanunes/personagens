class HomeController < ApplicationController
  def index
  end

  def about
    @about_me = "Meu nome é Wilson Rafael"
  end
end
