class HwsubmissionsController < ApplicationController

 def create
     @hwsubmission = HWSubmission.new
     @homework = Homework.find_by(id: params["format"])
     @hwsubmission.homework_id = @homework.id
     @student = Student.find_by(course_id: @homework.course_id, user_id: current_user.id)
     @hwsubmission.student_id = @student.id 
     @hwsubmission.save
     redirect_to root_path
   end
end
