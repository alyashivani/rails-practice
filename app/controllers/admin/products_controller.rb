class Admin::ProductsController < AdminsController
	def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    arr = []
    
    product_params[:product_variants_attributes].values.each do |a|
      if not arr.include? (a[:variant_attribute_id]) 
        arr.append(a[:variant_attribute_id]) 
      end
    end
    respond_to do |format|

      if product_params[:product_variants_attributes].values.count == arr.count
        
        if @product.save
          format.html { redirect_to admin_products_path, notice: 'Product was successfully created.' }
          
        end
      else
        format.html { render action: "new", notice: "Same attribute is selected multiple times." }
        format.js
      end
    end




    # if product_params[:product_variants_attributes].values.count == arr.count
    #   if @product.save
    #     redirect_to admin_products_path
    #   else
    #     render :new
    #   end
    # else
    #   redirect_to new_admin_product_path, notice: "Same attribute is selected multiple times"
    # end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to admin_products_path
  end

  def options_for_variant
    variant = Variant.find_by(id: params[:id])
    @variant_attributes = variant.variant_attributes
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :price, :availability, :manf_date, :avatar, product_variants_attributes: [:variant_id, :variant_attribute_id, :_destroy, :id])
  end
end