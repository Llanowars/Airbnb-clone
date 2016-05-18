class SpacesController < ApplicationController
  def new
    @space = Space.new
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

  def show
    @space = Space.find(params[:id])
  end

  private

  def space_params
    params.require(:space).permit(:name, :address, :daily_price, :weekly_price, :has_wifi, :has_drinks, :has_food, :description, :max_people, :photo)
  end

end



