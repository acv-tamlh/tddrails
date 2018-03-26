require 'rails_helper'
RSpec.describe Product, type: :model do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:description)}
  it {should validate_presence_of(:price)}
  it {should validate_numericality_of(:price).is_greater_than(0)}
  it {should belong_to(:category)}

  let!(:product_striphtml) { create(:product, description: '<p>this is description</p>') }
  it "validate the strip html description" do
    Category.create(title: 'title category')
    expect(product_striphtml.description).to eq 'this is description'
  end

  let!(:product_lowercase) { create(:product, title: 'TEST') }
  it "validate lowercase title product" do
    Category.create(title: 'title category')
    expect(product_lowercase.title).to eq 'test'
  end
  let!(:product_) { build(:product, title: '1111111', description: 'fgg') }
  it "validate title shotter than description" do
    product_.valid?
    expect(product_.errors.messages).to include(description: ["cant be shorter than title"])
  end
end
