require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#index' do
    it "gets list of product" do
      products = []
      Category.create(title: 'hello')
      products << Product.create(title: '123', description: '123456', price: 12, category_id: 1)
      products << Product.create(title: '123', description: '123456', price: 12, category_id: 1)
      get :index
      # byebug
      expect(assigns(:products)).to eq products
    end
  end
end
