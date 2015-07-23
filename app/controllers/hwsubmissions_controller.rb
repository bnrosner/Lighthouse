class HwsubmissionsController < ApplicationController

 def create
     @homework = Homework.find_by(id: params["format"])
     @homework.num_questions.times do
       @hwsubmission = HWSubmission.new
       @hwsubmission.homework_id = @homework.id
       @student = Student.find_by(course_id: @homework.course_id, user_id: current_user.id)
       @hwsubmission.student_id = @student.id 
       @hwsubmission.completed = false
       @hwsubmission.save
     end
     redirect_to root_path
   end

   def update
    @hwsubmission = HWSubmission.find_by(id: params["id"])
    if @hwsubmission.completed == true
      @hwsubmission.completed = false
    else
      @hwsubmission.completed = true
    end
    @hwsubmission.save
    redirect_to root_path
  end
end
