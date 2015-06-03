class ReviewsController < ApplicationController
  before_action :find_tutor, except: :index

  def index
  	# ....
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(params["review"])
    @review.tutor = @tutor
    @review.user = current_user
    if @review.save
      redirect_to tutor_url(@tutor)
    else
      render "new"
    end
  end

  def find_tutor
  	@tutor = Tutor.find_by(id: params["tutor_id"])
  end


end
