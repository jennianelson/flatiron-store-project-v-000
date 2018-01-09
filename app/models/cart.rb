class Cart < ActiveRecord::Base
    belongs_to :user
    has_many :line_items
    has_many :items, through: :line_items
    

    def total
        li_total = self.line_items.map do |li|
            price = li.item.price
            price * li.quantity
        end
        li_total.sum
    end

    def add_item(item_id)
        line_item = self.line_items.find {|li| li.item_id == item_id.to_i }
        if line_item
            line_item.quantity += 1
        else
            line_item = self.line_items.build(item_id: item_id, cart_id: self.id)
        end
        line_item
    end

    def checkout
        self.update(status: "submitted")
        update_item_inventory
        clear_cart
        self.destroy
    end

    def update_item_inventory
        self.line_items.each do |li|
            li.item.inventory -= li.quantity
            li.item.save
        end
    end

    def clear_cart
        self.line_items.destroy_all
    end

end
