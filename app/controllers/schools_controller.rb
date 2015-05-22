class SchoolsController < ApplicationController
 def new
    @school = School.new
  end

  def create
    @school = School.create(params["school"])
    if @school.valid?
      redirect_to courses_url, notice: "Great, you created a school!"
    else
      render "new"
    end
  end

  def destroy
    @school = School.find_by(id: params["id"])
    @school.delete
    redirect_to courses_url
  end
end