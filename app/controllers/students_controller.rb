class StudentsController < ApplicationController

  def index
    @user = current_user
    @students = Student.where(user_id: @user.id)
    @courses = Course.where(school_id: @user.school_id)
  end

  def show
    find_student
    @course = Course.find_by(id: @student.course_id)
    @students = Student.where(course_id: @course.id)
  end

  def new
    @student = Student.new
    @user = current_user
    @courses = Course.where(school_id: @user.school_id)
  end

  def create
    @student = Student.new
    @student.user_id = session["user_id"]
    @course = Course.find_by(id: params["format"])
    @student.course_id = @course.id
    @user = current_user
    @student.save
    if @student.valid?
      @user.students.each do |student|
        if student == @student
          student.active = true
          student.save
        else
          student.active = false
          student.save
        end
      student.save
      end
      redirect_to root_path, notice: "Great, you added a class to your profile!!!"
    else
      render "new"
    end
  end

  def update
    @student = Student.find_by(id: params["id"])
    @user = current_user
    @user.students.each do |student|
      if student==@student
        student.active = true
        student.save
      else
        student.active = false
        student.save
      end
    end
    redirect_to root_path
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