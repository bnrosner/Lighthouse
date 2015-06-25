class HomeworksController < ApplicationController
 
  def new
    if current_user.admin?
      @homework = Homework.new
      @course = Course.find_by(id: params["course_id"])
    else
      redirect_to root_path, notice: "Nice try, buddy"
    end
  end

  def create
    @homework = Homework.new(params["homework"])
    @course = Course.find_by(id: params["course_id"])
    @homework.course_id = @course.id
    if @homework.save
      redirect_to course_url(@course)
    else
      render "new"
    end
  end

end
