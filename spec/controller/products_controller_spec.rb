require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#index' do
    it "get list of product" do
      products = []
      Category.create(title: 'hell')
      products << Product.create(title: '123', description: '1234', price: 12, category_id: Category.last.id)
      products << Product.create(title: '123', description: '1234', price: 12, category_id: Category.last.id)
      get :index
      # byebug
      expect(assigns(:products)).to eq products
    end
  end
end
