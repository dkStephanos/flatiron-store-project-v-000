require 'pry'

class Cart < ActiveRecord::Base
    has_many :line_items
    has_many :items, through: :line_items
    belongs_to :user
    
    
    def add_item(item_id)
        line_item = LineItem.where("item_id = ? AND cart_id = ?", item_id, self.id).first
        if line_item
            line_item.quantity += 1
            line_item.save
        else
            line_item = self.line_items.build(quantity: 1, item_id: item_id, cart_id: self.id)
        end

        line_item
    end
    
    def total
        total = 0
        self.line_items.each do |line_item|
            total += line_item.item.price * line_item.quantity
        end
        total
    end
end
