# frozen_string_literal: true

# ProductUploadsController
class ProductUploadsController < ApplicationController
  def new
    @product_upload = ProductUpload.new
  end

  def create
    @product_upload = ProductUpload.new(product_upload_params)

    if @product_upload.save
      products = Inventory::Read.new(@product_upload.file).products
      store_in_database(products)
    else
      flash[:alert] = @product_upload.errors[:file].first
      render :new
    end
  end

  private

  def product_upload_params
    params.require(:product_upload).permit(:file)
  end

  def store_in_database(products)
    Inventory::Storage.new(products).save

    flash[:notice] = 'Upload realizado com Sucesso!'
    redirect_to products_path
  rescue InvalidCsv => e
    flash[:alert] = e.message

    redirect_to new_product_upload_path
  end
end
