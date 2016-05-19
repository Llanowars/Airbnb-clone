class SpacesController < ApplicationController

  def new
    @space = Space.new
    @hash = Gmaps4rails.build_markers(@spaces) do |space, marker|
      marker.lat space.latitude
      marker.lng space.longitude
      marker.infowindow render_to_string(:partial => "/spaces/map_box", locals: {space: space})
    end
  end

  def show
    @space = Space.find(params[:id])
    @space_coordinates = { lng: @space.lat, lat: @space.lng }

  end

  def create
    @space = Space.create(space_params)
    @space.save
    if @space.save
      redirect_to space_path(@space)
    else
      render "new"
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @spaces = Space.all
  end

  private

  def space_params
    params.require(:space).permit(:name, :address, :daily_price, :weekly_price, :has_wifi, :has_drinks, :has_food, :description, :max_people, :photos [], :latitude, :longitude)
  end

end



