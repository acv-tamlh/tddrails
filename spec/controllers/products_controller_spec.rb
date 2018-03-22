require 'rails_helper'
RSpec.describe ProductsController, type: :controller do
  describe '#index' do
    it "get list of product" do
      # products = []
      products = create_list(:product, 5)
      # Category.create(title: 'hell')
      # products << Product.create(title: '123', description: '1234', price: 12, category_id: Category.last.id)
      # products << Product.create(title: '123', description: '1234', price: 12, category_id: Category.last.id)
      get :index
      # byebug
      expect(assigns(:products)).to eq products
    end
    it 'render layout index' do
      get :index
      expect(response).to render_template :index
    end
  end
  describe '#create' do
    context 'save product' do
      it 'save product' do
        expect{
          post :create, params: { product: FactoryBot.attributes_for(:product) }
         }.to change(Product, :count).by(1)
      end
      it 'save product fail' do
        expect {
          post :create, params: { product: FactoryBot.attributes_for(:product, title: '') }
         }.to change(Product, :count).by(0)
      end
    end
    context 'redirect new product' do
      it 'save sucessfully' do
        post :create, params: { product: FactoryBot.attributes_for(:product)}
        expect(response).to redirect_to products_path
      end
      it 'save fail' do
        post :create, params: { product: FactoryBot.attributes_for(:product, price: 0)}
        # byebug
        expect(response).to render_template :new
      end
    end
  end
  describe '#edit' do
    let(:product) { create(:product) }
    it 'true id product' do
      get :edit, params: {id: product.id}
      expect(assigns(:product).id).to eq product.id
    end
    it 'render layout edit' do
      get :edit, params: {id: product.id}
      expect(response).to render_template :new
    end
  end
  describe '#show' do
    let(:product2) { create(:product) }
    it 'render tempalte show' do
      get :show, params: {id: product2.id}
      expect(response).to render_template :show
    end
    it 'assign id show' do
      get :show, params: { id: product2.id }
      expect(assigns(:product).id).to eq product2.id
    end
  end
end
