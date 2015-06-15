class MessagesController < ApplicationController
  before_action :find_tutor

  def index
    @messages = Message.all
    @user = current_user
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params["message"])
    @message.tutor = @tutor
    @user = current_user
    @message.student = Student.find_by(user_id: @user.id, course_id: @tutor.course_id)
    if @message.save
      redirect_to tutor_url(@tutor), notice: "Great, you created a message!!!"
    else
      render "new"
    end
  end

  def find_tutor
  	@tutor = Tutor.find_by(id: params["tutor_id"])
  end
end