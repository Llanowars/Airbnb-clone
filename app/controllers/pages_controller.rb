class PagesController < ApplicationController

  def home
  end

  def dashboard
    @reservations = Reservation.all
    @reviews = Review.all
    @spaces = Space.all
  end

end
