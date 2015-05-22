class TutorsController < ApplicationController

  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.create(params["tutor"])
    if @tutor.valid?
      redirect_to courses_url, notice: "Great, you became a tutor for a class!!!"
    else
      render "new"
    end
  end

  def destroy
    @tutor = Tutor.find_by(id: params["id"])
    @tutor.delete
    redirect_to courses_url
  end
end
