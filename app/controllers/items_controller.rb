class ItemsController < ApplicationController
    def index
        items = Item.all
        render json: items, except: [:created_at, :updated_at]
    end

    def show
        item = Item.find_by(id: params[:id])
        if item
            render json: items, except: [:created_at, :updated_at]
        else
            render json: {message: "Item not found."}
        end
    end
end
