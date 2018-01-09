module ItemHelper
    def format_price(item)
        item.price.to_f/100
    end
end