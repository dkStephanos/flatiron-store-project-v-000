require 'pry'

class CartsController < ApplicationController
    
    helper_method :current_cart
    
    def show
       
    end
    
    def checkout
        @cart = Cart.find(params[:id])
        
        @cart.line_items.each do |line_item|
            item = Item.find(line_item.item_id)
            item.inventory -= line_item.quantity
            item.save
        end
        
        current_user.current_cart = nil
        current_user.save
        
        
        flash[:notice] = "Cart Checked Out"
        
        redirect_to @cart
        
    end
end
