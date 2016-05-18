class ReviewsController < ApplicationController

  before_action :find_space, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.space = @space
    if @review.save
      redirect_to space_path(@space)
    else
      render 'spaces/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:start_at, :end_at)
  end

  def find_space
    @space = Space.find(params[:space_id])
  end

end
