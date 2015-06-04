class StudentsController < ApplicationController

  def new
    @student = Student.new
    find_courses_at_school
  end

  def create
    @student = Student.new
    @student.user_id = session["user_id"]
    @student.course_id = params["student"]["course_id"]
    if @student.valid?
      @student.save
      redirect_to courses_url, notice: "Great, you added a class to your profile!!!"
    else
      render "new"
    end
  end

  def edit
    find_student
    find_courses_at_school
  end

  def update
    find_student
    @student.available = params["student"]["available"]
    @student.save
    redirect_to courses_url
  end

  def destroy
    find_student
    @student.delete
    redirect_to courses_url
  end

  def find_student
    @student = Student.find_by(id: params["id"])
  end

  def find_courses_at_school
    @user = current_user
    @courses = Course.where(school_id: @user.school_id)
  end

end
