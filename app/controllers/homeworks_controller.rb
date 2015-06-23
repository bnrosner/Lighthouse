class HomeworksController < ApplicationController
  before_action :find_tutor, except: :index

  def new
    if current_user.admin?
      @homework = Homework.new
      @courses = Course.where(id: params["course_id"])
    else
      redirect_to root_path, notice: "Nice try, buddy"
    end
    @homework = Homework.new
    @courses = Cou
  end

  def create
    @homework = Homework.new(params["homework"])
    @homework.course = @course
    @review.user = current_user
    if @review.save
      redirect_to tutor_url(@tutor)
    else
      render "new"
    end
  end

  def find_course
  	@course = Course.find_by(id: params["course_id"])
  end


end
