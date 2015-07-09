class HwsubmissionsController < ApplicationController

  def new
    if current_user.admin?
      @hwsubmission = HWSubmission.new
      # @course = Course.find_by(id: params["course_id"])
    else
      redirect_to root_path, notice: "Nice try, buddy"
    end

 def create
     @hwsubmission = HWSubmission.new
     @hwsubmission.student_id = session["user_id"]
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
      redirect_to new_hwsubmission_url(@student), method:  :post
    end
end
