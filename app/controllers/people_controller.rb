class PeopleController < ApplicationController

  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    if params[:q].present?
      @people = Person.search(params[:q]).records.order(:first_name, :last_name).page params[:page]
    else
      @people = Person.order(:first_name, :last_name).page params[:page]
    end
  end

  def show
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        @person.send_created_email_to_all
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @person.destroy
    @person.send_deleted_email_to_all
    respond_to do |format|
      format.html { redirect_to people_path, notice: 'Person was successfully destroyed.' }
    end
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :email, :job, :bio, :gender, :birthdate, :picture)
  end
end
