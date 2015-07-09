class CoursesController < ApplicationController

  def index
  	# ....
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
      redirect_to root_path
    else
      render "new"
    end
  end

end
