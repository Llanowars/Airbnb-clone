class ReservationsController < ApplicationController

  before_action :find_space, only: [:new, :create]

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.create(reservation_params)
    @reservation.space = @space
    @reservation.user = current_user
    @reservation.start_at = params[:reservation][:start_at]
    @reservation.end_at = params[:reservation][:end_at]
    @reservation.price = @space.daily_price
    if @reservation.save
      redirect_to space_path(@space)
    else
      render 'spaces/show'
    end
  end


  private

  def reservation_params
    params.require(:reservation).permit(:start_at, :end_at, :space_id, :user_id, :price)
  end

  def find_space
    @space = Space.find(params[:space_id])
  end

end

