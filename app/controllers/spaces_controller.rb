class SpacesController < ApplicationController

  def index
    @spaces = Space.all
    search
    @markers = Gmaps4rails.build_markers(@results) do |space, marker|
          marker.lat space.latitude
          marker.lng space.longitude
        end
  end

  def gmaps4rails_infowindow
      "<%=@space.name%>"
    end

  def new
    @space = Space.new
    @hash = Gmaps4rails.build_markers(@spaces) do |space, marker|
      marker.lat space.latitude
      marker.lng space.longitude
      marker.infowindow render_to_string(:partial => "/spaces/map_box", locals: {space: space})
    end
  end

  def search
    @search_radius = params[:search_radius] ?  params[:search_radius] : 5
    params[:address] == "" ? @address = "Paris, France" : @address = params[:address]
    @results = @spaces.near(@address, @search_radius)
  end

  def show
    @space = Space.find(params[:id])
    @markers = Gmaps4rails.build_markers(@space) do |space, marker|
          marker.lat space.latitude
          marker.lng space.longitude
        end
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
    @space = Space.find(params[:id])
    if @space.update_attributes(space_params)
      redirect_to space_path(@space)
    else
      render 'edit'
    end
  end

  def edit
    @space = Space.find(params[:id])
  end

  def destroy
  end




  private

  def space_params
    params.require(:space).permit(:name, :reservation, :address, :daily_price, :weekly_price, :has_wifi, :has_drinks, :has_food, :description, :max_people, :latitude, :longitude, photos: [])
  end

end



