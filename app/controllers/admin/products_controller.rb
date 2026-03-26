module Admin
  class ProductsController < BaseController
    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_products_path, notice: "Product created successfully."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @product = Product.find(params[:id])
    end

    def update
      @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to admin_products_path, notice: "Product updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to admin_products_path, notice: "Product deleted successfully."
    end

    private

    def product_params
      params.require(:product).permit(:name, :description, :price, :stock_quantity, :category_id)
    end
  end
end