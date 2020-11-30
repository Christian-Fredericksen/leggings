class SessionController < ApplicationController
    def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            token = encode_token(user.id)
            render json: {user: UserSerializer.new(user), token: token}
        else
            render json: {errors: "Either your username or password was incorrect. Please Try again."}
        end
    end
    def autologin
        user = session_user
        if user
            token = encode_token(user.id)
            render json: {user: UserSerializer.new(user), token: token}
        else
            render json: {errors: "Dont try and hack me. I see YOU!"}
        end
    end
end
