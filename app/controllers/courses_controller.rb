class CoursesController < ApplicationController
before_action :find_school, except: :index

  def index
  	# ....
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

  def find_school
  	@school = School.find_by(id: params["school_id"])
  end


end
