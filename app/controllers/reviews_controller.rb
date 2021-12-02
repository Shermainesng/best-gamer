class ReviewsController < ApplicationController
  def new
    @current_user = current_user
    @slot = Slot.find(params[:slot_id])
    if @current_user = @slot.order.user
      @review = Review.new
    end
  end

  def create
    @current_user = current_user
    @slot = Slot.find(params[:slot_id])
    if @current_user = @slot.order.user
      @review = Review.new(reviews_params)
      @review.user = @slot.user
      @review.order = @slot.order
      if @review.save!
        redirect_to "/#{@slot.user.username}"
      else
        render :new
      end
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end
end
