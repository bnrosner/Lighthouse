class PeopleController < ApplicationController

  def index
  	@people = Person.all
  end

  def show
  	@person = Person.find_by(id: params["id"])
  	@tutor = Tutor.where(person_id: params["id"])
  	@student = Student.where(person_id: params["id"])
  end

end
