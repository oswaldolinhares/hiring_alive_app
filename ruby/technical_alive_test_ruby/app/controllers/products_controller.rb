# frozen_string_literal: true

# ProductsController
class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
end
