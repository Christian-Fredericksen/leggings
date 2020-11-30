class UsersController < ApplicationController
    def new
        user = User.new
    end

    def index
    users = User.all 
    end 
  
    def create
        user = User.new(user_params)
        if user.save
            token = encode_token(user.id)
            render json: { user: UserSerializer.new(user), token: token }
        else
            render json: { errors: user.errors.full_messages.to_sentence} 
        end
    end
  
    def show
        user = User.find_by(id: params[:id])
            if user
            render json: user, except: [:created_at, :updated_at]
        else
            render json: {message: "User not found."}
        end
    end
  
  private
    def user_params
    params.require(:user).permit(:email, :password)
    end
end
