class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def show
    @num_products = Product.count
    @num_product_items = Product.sum('quantity')
    @num_categories = Category.count
  end
end
