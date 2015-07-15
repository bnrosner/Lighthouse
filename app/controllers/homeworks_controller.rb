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
    if @homework.valid?
      @homework.save
      @course.homeworks.each do |homework|
        if homework == @homework
          homework.active = true
        else
          homework.active = false
        end
      homework.save
      end
      redirect_to courses_url
    else
      render "new"
    end
  end

  def update
    @course = Course.find_by(id: params["course_id"])
    @homework = Homework.find_by(id: params["id"])
    @homeworks = Homework.where(course_id: params["course_id"])
    @homeworks.each do |homework|
      if homework==@homework
        homework.active = true
        homework.save
      else
        homework.active = false
        homework.save
      end
    end
    redirect_to root_path
  end
end
