require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation: ' do
    it 'a product with all 4 fields should be valid' do
      @category = Category.create(name: "Cars")
      @product = Product.create(name: "Civic", price_cents: 12, quantity: 34, category: @category)
      expect(@product.valid?).to be true
    end
    
    it 'name should be invalid' do
      @category = Category.create(name: "Cars")      
      @product = Product.create(name: nil, price_cents: 12, quantity: 34, category: @category)
      # puts @product.errors.full_messages
      expect(@product.errors[:name]).to include("can\'t be blank")
    end

    it 'price_cents should be invalid' do
      @category = Category.create(name: "Cars")      
      @product = Product.create(name: "Civic", price_cents: nil, quantity: 34, category: @category)
      # puts @product.errors.full_messages
      expect(@product.errors[:price]).to include("can\'t be blank")
    end

    it 'quantity should be invalid' do
      @category = Category.create(name: "Cars")      
      @product = Product.create(name: "Civic", price_cents: 12, quantity: nil, category: @category)
      # puts @product.errors.full_messages
      expect(@product.errors[:quantity]).to include("can\'t be blank")
    end
    
    it 'category should be nil' do
      @category = nil
      # puts @category.errors.full_messages
      expect(@category).to be_nil
    end
  end
end
