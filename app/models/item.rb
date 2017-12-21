require 'pry'

class Item < ActiveRecord::Base
    belongs_to :category
    has_many :line_items
    
    def self.available_items
        Item.all.select{ |item| item.inventory > 0 }.map{ |i| i }
    end
end
