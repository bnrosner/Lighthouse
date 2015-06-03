class TutorsController < ApplicationController
  before_action :find_tutor, except: [:new, :create]

  def show
    @tutor = find_tutor
  end

  def new
    @tutor = Tutor.new
    @user = current_user
    @courses = Course.where(school_id: @user.school_id)
  end

  def create
    @tutor = Tutor.new
    @tutor.user_id = session["user_id"]
    @tutor.course_id = params["tutor"]["course_id"]
    if @tutor.valid?
      @tutor.save
      redirect_to courses_url, notice: "Great, you became a tutor for a class!!!"
    else
      render "new"
    end
  end

  def edit
    find_tutor
  end

  def update
    find_tutor
    @tutor.available = params["tutor"]["available"]
    @tutor.save
    redirect_to courses_url
  end

  def destroy
    find_tutor
    @tutor.delete
    redirect_to courses_url
  end

  def find_tutor
    @tutor = Tutor.find_by(id: params["id"])
  end
end
