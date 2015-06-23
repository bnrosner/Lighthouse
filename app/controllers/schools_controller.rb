class SchoolsController < ApplicationController

  def index
    @schools = School.all
  end

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
        redirect_to schools_url, notice: "Great, you created a school!"
      else
        render "new"
      end
    else
      redirect_to root_path, alert: "Nice try buddy"
    end
  end

  def edit
    if current_user.admin?
      find_school
    else
      redirect_to root_path, alert: "Nice try buddy"
    end
  end

  def update
    if current_user.admin?
      find_school
      @school.update(params["school"])
      redirect_to root_path
    else
      redirect_to root_path, alert: "Nice try buddy"
    end
  end

  def destroy
    if current_user.admin?
      find_school
      @school.delete
      redirect_to root_path, alert: "Nice try buddy"
    else
      redirect_to root_path, alert: "Nice try buddy"
    end
  end

  def find_school
    @school = School.find_by(id: params["id"])
  end

end
