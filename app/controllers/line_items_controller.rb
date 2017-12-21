require 'pry'

class LineItemsController < ApplicationController
    def create
        
        current_user.create_current_cart unless users_current_cart

        users_current_cart.add_item(params[:item_id])
        users_current_cart.save
        
        redirect_to cart_path(users_current_cart)
    end
end
