class ProductsController < ApplicationController
  def welcome
    render :welcome
  end

  def index
    @products = Product.all
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product created!'
      redirect_to products_path
    else
      flash[:alert] = 'See errors below.'
      @products = Product.all
      render :index
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = 'Product created!'
      redirect_to product_path(@product)
    else
      flash[:alert] = 'See errors below.'
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = 'Product successfully destroyed.'
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:name, :cost, :country)
  end
end
