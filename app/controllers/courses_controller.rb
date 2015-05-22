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
    @course = Course.create(params["course"])
    if @course.valid?
      redirect_to courses_url, notice: "Great, you created a course!!!"
    else
      render "new"
    end
  end

  def edit
    @course = Course.find_by(id: params["id"])
  end

  def update
    @course = Course.find_by(id: params["id"])
    @course.update(params["course"])
    redirect_to courses_url
  end

  def destroy
    @course = Course.find_by(id: params["id"])
    @course.delete
    redirect_to courses_url
  end

end
