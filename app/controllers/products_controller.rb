class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all

    if params[:search].present?
      @products = @products.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end