module CartHelper
    def num_of_items_in_cart
        current_cart.line_items.size
    end

    def cart_empty?
        num_of_items_in_cart == 0
    end
end