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
    it 'render layout new' do
      get :index
      response.should render_template :index
    end
  end
  describe '#edit' do
    let(:product) {create(:product)}

    it 'true id product' do
      get :edit, params: {id: product.id}
      expect(assigns(:product).id).to eq product.id
    end
    it 'render layout edit' do
      get :edit, params: {id: product.id}
      response.should render_template :new
    end
  end
end
