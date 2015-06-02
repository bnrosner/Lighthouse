class CoursesController < ApplicationController

  def index
    @courses = Course.all
    @user = User.find_by(id: session["user_id"])
  end

  def show
    @course = Course.find_by(id: params["id"])
  end

  def new
    if current_user.admin?
      @course = Course.new
    else
      redirect_to root_path, alert: "Nice try buddy"
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
      redirect_to root_path, alert: "Nice try buddy"
    end
  end

  def edit
    if current_user.admin?
      @course = Course.find_by(id: params["id"])
    else
      redirect_to root_path, alert: "Nice try buddy" 
    end
  end

  def update
    if current_user.admin?
      @course = Course.find_by(id: params["id"])
      @course.update(params["course"])
      redirect_to courses_url
    else
      redirect_to root_path, alert: "Nice try buddy"
    end
  end

  def destroy
    if current_user.admin?
      @course = Course.find_by(id: params["id"])
      @course.delete
      redirect_to courses_url
    else
      redirect_to root_path, alert: "Nice try buddy"
    end
  end
end
