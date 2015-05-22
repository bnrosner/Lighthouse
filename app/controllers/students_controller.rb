class StudentsController < ApplicationController

  def new
    @student = Student.new
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

  def destroy
    @student = Student.find_by(id: params["id"])
    @student.delete
    redirect_to courses_url
  end

end
