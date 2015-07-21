class QuestionsubmissionsController < ApplicationController

def create
     @questionsubmission = QuestionSubmission.new
     @questionsubmission.hwsubmission_id = params["format"]
     @questionsubmission.completed = false 
     @questionsubmission.save
     redirect_to root_path
   end
end
