class ProductsController < ApplicationController
  load_and_authorize_resource
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products or /products.json
  def index
    Product.all
  end

  def search
    @products =
      if params[:search].present?
        Product.search params[:search], fields: [:name], match: :word_middle
      else
        Product.all
      end
  end

  # GET /products/1 or /products/1.json
  def show
    @product_attachments = @product.product_attachments.all
  end

  # GET /products/new
  def new
    @product = Product.new
    @product_attachments = @product.product_attachments.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params.merge(supplier: current_user))

    respond_to do |format|
      if @product.save
        if params[:product_attachments]
          params[:product_attachments]['photo'].each do |a|
            @product_attachments = @product.product_attachments.create!(photo: a, product_id: @product.id)
          end
        end

        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params.merge(supplier: current_user))
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name,
                                    product_attachments_attributes:
                                    %i[id product_id photo])
  end
end
