class StudentsController < ApplicationController

  def index
    @user = current_user
    @students = Student.where(user_id: @user.id)
  end

  def show
    find_student
    @course = Course.find_by(id: @student.course_id)
  end

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
      redirect_to root_path, notice: "Great, you added a class to your profile!!!"
    else
      render "new"
    end
  end

  def destroy
    find_student
    @student.delete
    redirect_to root_path
  end

  def find_student
    @student = Student.find_by(id: params["id"])
  end
end