class CartsController < ApplicationController
    def new
        cart = Cart.new
    end

    def create
        cart = Cart.new(cart_params)
        if cart.save
            render json: cart, except: [:created_at, :updated_at]
        else
            render json: {message: "cart Failed"}
        end
    end

    def index
        user_id = params[:user_id]
        user = User.find(user_id)
        cart = user.cart
        render json: cart, include: [:item]
    end

    def destroy
        cart_id = params[:id]
        cart = Cart.find(cart_id)
        cart.destroy
    end


    private
        def cart_params
        params.require(:cart).permit(:user_id, :item_id)
        end
    end
end
