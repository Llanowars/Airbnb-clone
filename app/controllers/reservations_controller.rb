class ReservationsController < ApplicationController

  before_action :find_space, only: [:new, :create]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.create(reservation_params)
    @reservation.space = @space
    if @reservation.save
      redirect_to space_path(@space)
    else
      render 'spaces/show'
    end
  end


  private

  def reservation_params
    params.require(@reservation).permit(:start_at, :end_at)
  end

  def find_space
    @space = Space.find(params[:space_id])
  end

end

