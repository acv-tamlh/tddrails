require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe '#index' do
    it "gets list of product" do
      products = []
      products << Product.create(title: '123', description: '123456', price: 12)
      products << Product.create(title: '123', description: '123456', price: 12)
      get :index
      expect(assigns(:products)).to eq products
    end
  end
end
