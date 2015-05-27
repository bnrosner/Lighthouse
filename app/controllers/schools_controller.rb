class SchoolsController < ApplicationController
 def new
    if current_user.admin?
      @school = School.new
    else
      redirect_to root_path, alert: "Nice try buddy"
    end
  end

  def create
    if current_user.admin?  
      @school = School.create(params["school"])
      if @school.valid?
        redirect_to courses_url, notice: "Great, you created a school!"
      else
        render "new"
      end
    else
      redirect_to root_path, alert: "Nice try buddy"
    end
  end

  def destroy
    if current_user.admin?
      @school = School.find_by(id: params["id"])
      @school.delete
      redirect_to courses_url
    else
      redirect_to root_path, alert: "Nice try buddy"
    end
  end
end