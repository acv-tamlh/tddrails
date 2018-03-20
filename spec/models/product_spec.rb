require 'rails_helper'

RSpec.describe Product, type: :model do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:description)}
  it {should validate_presence_of(:price)}
  it {should validate_numericality_of(:price).is_greater_than(0)}
  it {should belong_to(:category)}

  context "Strip html from description" do
    it "validate the strip html description" do
      product = Product.new(title: 'test', description: '<p>this is description</p>', price: 12)
      product.save
      expect(product.description).to eq 'this is description'
    end
  end
end
