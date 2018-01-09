class LineItemsController < ApplicationController
    def create
        
        current_user.create_current_cart(user_id: current_user.id) unless current_cart

        line_item = current_cart.add_item(params[:item_id])
        if line_item.save
            current_user.save
            redirect_to cart_path(current_cart), {notice: 'Item added to cart!'}
        else
            redirect_to root_path, {notice: 'Unable to add item'}
        end
    end

    def destroy
        # binding.pry
        li = LineItem.find(params[:id])
        li.destroy
        redirect_to cart_path(li.cart_id)
    end

    # private

    # def current_cart
    #     current_user.current_cart
    # end

end
