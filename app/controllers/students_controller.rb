class StudentsController < ApplicationController

  def new
    @student = Student.new
    @user = User.find_by(id: session["user_id"])
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
    @student = Student.find_by(id: params["id"])
  end

  def update
    @student = Student.find_by(id: params["id"])
    @student.available = params["student"]["available"]
    @student.save
    redirect_to courses_url
  end

  def destroy
    @student = Student.find_by(id: params["id"])
    @student.delete
    redirect_to courses_url
  end
end
