class UsersController < ApplicationController
  skip_before_action :auth, only: [:new, :create]
  layout false, only: [:new, :create]

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to root_path, alert: "Nice try buddy"
    end
  end

  def show
    if current_user.admin?
      @user = User.find_by(id: params["id"])
      @tutor = Tutor.where(User_id: params["id"])
      @student = Student.where(User_id: params["id"])
    else
      redirect_to root_path, alert: "Nice try buddy"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params["user"])
    if @user.valid?
      redirect_to users_url, notice: "Great, you registered!!!"
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

