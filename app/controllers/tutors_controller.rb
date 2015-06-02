class TutorsController < ApplicationController

  def new
    @tutor = Tutor.new
  end

  def create
    @tutor = Tutor.new
    @tutor.user_id = session["user_id"]
    @tutor.course_id = params["tutor"]["course_id"]
    if @tutor.valid?
      @tutor.save
      redirect_to courses_url, notice: "Great, you became a tutor for a class!!!"
    else
      render "new"
    end
  end

  def edit
    @tutor = Tutor.find_by(id: params["id"])
  end

  def update
    @tutor = Tutor.find_by(id: params["id"])
    @tutor.available = params["tutor"]["available"]
    @tutor.save
    redirect_to courses_url
  end

  def destroy
    @tutor = Tutor.find_by(id: params["id"])
    @tutor.delete
    redirect_to courses_url
  end
end
