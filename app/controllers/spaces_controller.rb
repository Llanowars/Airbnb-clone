class SpacesController < ApplicationController
  def new
  end

  def create
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
end
