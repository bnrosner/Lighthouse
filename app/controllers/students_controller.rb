class StudentsController < ApplicationController
  before_action :find_student, except: [:new, :create]

  def new
    @student = Student.new
    @user = current_user
    @courses = Course.where(school_id: @user.school_id)
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
end
