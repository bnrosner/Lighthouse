class CoursesController < ApplicationController
  before_action :find_course, except: [:index, :new, :create]

  def index
    @courses = Course.all
    @user = current_user
  end

  def show
    find_course
  end

  def new
    if current_user.admin?
      @course = Course.new
    else
      redirect_root_path
    end
  end

  def create
    if current_user.admin?
      @course = Course.create(params["course"])
      if @course.valid?
        redirect_to courses_url, notice: "Great, you created a course!!!"
      else
        render "new"
      end
    else
      redirect_root_path
    end
  end

  def edit
    if current_user.admin?
      find_course
    else
      redirect_root_path 
    end
  end

  def update
    if current_user.admin?
      find_course
      @course.update(params["course"])
      redirect_to courses_url
    else
      redirect_root_path
    end
  end

  def destroy
    if current_user.admin?
      find_course
      @course.delete
      redirect_to courses_url
    else
      redirect_to root_path, alert: "Nice try buddy"
    end
  end

  def find_course
    @course = Course.find_by(id: params["id"])
  end

end
