class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params["id"])
    @tutor = Tutor.where(User_id: params["id"])
    @student = Student.where(User_id: params["id"])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params["user"])
    if @user.valid?
      redirect_to users_url, notice: "Great, you created a user!!!"
    else
      render "new"
    end
  end

  def edit
    @user = User.find_by(id: params["id"])
  end

  def update
    @user = User.find_by(id: params["id"])
    @user.update(params["user"])
    redirect_to users_url
  end

  def destroy
    @user = User.find_by(id: params["id"])
    @user.delete
    redirect_to users_url
  end

end

