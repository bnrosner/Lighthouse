class SchoolsController < ApplicationController
 
  def index
    if current_user.admin?
      @schools = School.all
    else
      redirect_to root_path, alert: "Nice try buddy"
    end
  end

  def show
    if current_user.admin?
      @school = School.find_by(id: params["id"])
    else
      redirect_to root_path, alert: "Nice try buddy"
    end
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
    @school = School.find_by(id: params["id"])
  end

  def update
    @school = School.find_by(id: params["id"])
    @school.update(params["school"])
    redirect_to schools_url
  end

  def destroy
    if current_user.admin?
      @school = School.find_by(id: params["id"])
      @school.delete
      redirect_to schools_url
    else
      redirect_to root_path, alert: "Nice try buddy"
    end
  end
end