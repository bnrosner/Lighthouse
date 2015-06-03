class SchoolsController < ApplicationController
  before_action :find_school, except: [:index, :new, :create]

  def index
    if current_user.admin?
      @schools = School.all
    else
      redirect_root_path
    end
  end

  def show
    if current_user.admin?
      find_school
    else
      redirect_root_path
    end
  end

  def new
    if current_user.admin?
      @school = School.new
    else
      redirect_root_path
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
      redirect_root_path
    end
  end

  def edit
    find_school
  end

  def update
    find_school
    @school.update(params["school"])
    redirect_to schools_url
  end

  def destroy
    if current_user.admin?
      find_school
      @school.delete
      redirect_to schools_url
    else
      redirect_root_path
    end
  end

  def find_school
    @school = School.find_by(id: params["id"])
  end

end