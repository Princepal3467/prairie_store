class OrdersController < ApplicationController
  def index
    @order = current_order
  end

  def add_to_cart
    product = Product.find(params[:id])
    order = current_order

    item = order.order_items.find_by(product_id: product.id)

    if item
      item.quantity += 1
      item.save
    else
      order.order_items.create!(
        product: product,
        quantity: 1,
        price_at_time: product.price
      )
    end

    redirect_to orders_path
  end

  private

  def current_order
    if session[:order_id] && Order.exists?(session[:order_id])
      Order.find(session[:order_id])
    else
      user = User.first || User.create!(
        name: "Demo User",
        email: "demo@example.com",
        password_digest: "demo123"
      )

      order = Order.create!(
        user: user,
        status: "cart",
        total_price: 0
      )

      session[:order_id] = order.id
      order
    end
  end
end