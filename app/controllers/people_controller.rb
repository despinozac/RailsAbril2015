class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
    @person.addresses.build

    # 5.times do
    #   @person.addresses.build
    # end
  end

  def create
    @person = Person.new(permit_params)

    if @person.save
      redirect_to people_path
    else
      render 'new'
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(permit_params)
      redirect_to people_path 
    else
      render 'edit'
    end
  end

  def asociar_car
    @person = Person.find(params[:id])
  end

  def destroy
    person = Person.find(params[:id])

    if person.destroy
      redirect_to people_path    
    end
  end

  private

  def permit_params
    params.require(:person).permit(:nombre, :apellido, :ci, addresses_attributes: [:id, :line1, :line2, :state])
  end
end
