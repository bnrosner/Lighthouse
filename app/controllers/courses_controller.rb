class CoursesController < ApplicationController

  def index
  	@courses = Course.all
  end

  def show
    @course = Course.find_by(id: params["id"])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(params["course"])
    @course.school = School.find_by(id: current_user.school_id)
    if @course.save
      redirect_to courses_url
    else
      render "new"
    end
  end

  def destroy
    @course = Course.find_by(id: params["id"])
    @course.delete
    redirect_to courses_url
  end

end
