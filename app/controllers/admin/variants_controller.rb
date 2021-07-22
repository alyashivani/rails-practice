class Admin::VariantsController < AdminsController
	before_action :set_variant, only: [:show, :edit, :update, :destroy]

    def index
        @variants = Variant.all
    end

    def new
        @variant = Variant.new
    end

    def create
        @variant = Variant.create(variant_params)
        if @variant.save
            redirect_to @variant
        else
            render "new"
        end
    end

    def show
    end

    def edit
    end

    def update
        if @variant.update(variant_params)
            redirect_to admin_variants_path
        else
            render "edit"
        end
    end

    def destroy
        @variant.destroy
        redirect_to admin_variants_path
    end

    private 

        def set_variant
            @variant = Variant.find(params[:id])
        end

        def variant_params
            params.require(:variant).permit(:name, variant_attributes_attributes: [:id, :name, :_destroy])
        end
end