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
    @course.school = @school
    if @course.save
      redirect_to schools_url
    else
      render "new"
    end
  end

end
