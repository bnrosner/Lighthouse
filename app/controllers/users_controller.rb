class UsersController < ApplicationController
  skip_before_action :auth, only: [:new, :create]
  layout false, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params["user"])
    if @user.valid?
      redirect_to root_path, notice: "Great, you registered!!!"
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
    redirect_to root_path
  end

  def find_user
    @user = User.find_by(id: params["id"])
  end
end

