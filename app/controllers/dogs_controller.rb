class DogsController < ApplicationController
  def create
    if current_user
    dog = Dog.new({  
      name: params[:name],
      age: params[:age],
      breed: params[:breed],
      user_id: current_user.id
    })
    if dog.save
      render json: dog
    else
      render json: { errors: dog.errors.full_messages }, status: :unprocessable_entity
    end
  else render json: {message: "You must be logged in to create a new dog!"}, status: :unauthorized
    end
  end

  def index
    if current_user
      render json: {current_user: current_user, dogs: current_user.dogs}
  else
    render json: [], status: :unauthorized
    end
  end
end
