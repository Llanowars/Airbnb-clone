class PagesController < ApplicationController

  def home
  end

  def dashboard
    @reservations = Reservation.all
  end

end
