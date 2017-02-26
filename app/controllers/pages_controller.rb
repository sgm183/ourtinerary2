class PagesController < ApplicationController
  def home
    redirect_to trips_path if logged_in?

  end
end
