class HomeworksController < ApplicationController
 
  def new
    if current_user.admin?
      @homework = Homework.new
    else
      redirect_to root_path, notice: "Nice try, buddy"
    end
  end

  def create
    @homework = Homework.new(params["homework"])
    @homework.course = @course
    if @homework.save
      redirect_to course_url(@course)
    else
      render "new"
    end
  end

end
