class CartsController < ApplicationController

    def show
        @current_cart = Cart.find(params[:id])
    end

    def checkout 
        current_cart = Cart.find(params[:id])
        current_cart.checkout
        current_user.update(current_cart_id: nil)
        redirect_to cart_path(current_cart), {notice: 'You have checked out!'}
        
    end

    def destroy
        cart = Cart.find(params[:id])
        cart.destroy
        current_user.update(current_cart_id: nil)

        redirect_to store_path
    end

end
