class PeopleController < ApplicationController

  def index
  	@people = Person.all
  end

  def show
  	@person = Person.find_by(id: params["id"])
  	@tutor = Tutor.where(person_id: params["id"])
  	@student = Student.where(person_id: params["id"])
  end

  def new
  	@person = Person.new
  end

  def create
  	Person.create(params["person"])
  	redirect_to people_url
  end

  def edit
  	@person = Person.find_by(id: params["id"])
  end

  def update
  	person = Person.find_by(id: params["id"])
  	person.update(params["person"])
  	redirect_to people_url
  end

  def destroy
  	person = Person.find_by(id: params["id"])
  	person.delete
  	redirect_to people_url
  end
end
