require 'rails_helper'



RSpec.describe Product, type: :model do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:description)}
  it {should validate_presence_of(:price)}
  it {should validate_numericality_of(:price).is_greater_than(0)}
  it {should belong_to(:category)}

  context "Strip html from description" do
    # let!(:producthtml) {build (:product, description: '<p>this is description</p>')}
    it "validate the strip html description" do
      Category.create(title: 'title category')
      product = Product.new(title: 'test', description: '<p>this is description</p>', price: 12, category_id: Category.last.id)
      product.save
      expect(product.description).to eq 'this is description'
    end
    it "validate lowercase title product" do
      Category.create(title: 'title category')
      product = Product.new(title: 'TEST', description: 'this is description', price: 12, category_id: Category.last.id)
      product.save
      # byebug
      expect(product.title).to eq 'test'
    end
    let!(:product_) { build(:product, title: '1111111', description: 'fgg') }
    it "validate title shotter than description" do

      # Category.create(title: 'new')
      # product = Product.new(title: 'test asd ad asd asd asd ', description: 'this is description', price: 12, category_id: Category.last.id)
      # byebug
      product_.valid?
      expect(product_.errors.messages).to include(description: ["cant be shorter than title"])
    end
  end
end
