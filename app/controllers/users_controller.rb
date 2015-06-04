class UsersController < ApplicationController
  skip_before_action :auth, only: [:new, :create]
  before_action :find_user, except: [:index, :show, :new, :create]
  layout false, only: [:new, :create]

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_root_path
    end
  end

  def show
    if current_user.admin?
      @user = current_user
      @tutor = Tutor.where(user_id: current_user.id)
      @student = Student.where(user_id: current_user.id)
    else
      redirect_root_path
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
    find_user
  end

  def update
    find_user
    @user.update(params["user"])
    redirect_to users_url
  end

  def destroy
    find_user
    @user.delete
    redirect_to users_url
  end

  def find_user
    @user = User.find_by(id: params["id"])
  end

end

