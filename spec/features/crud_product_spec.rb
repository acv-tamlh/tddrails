require 'rails_helper'

describe 'CRUD product', type: :feature do
  let!(:product) {create(:product, title: 'asdasd')}

  it 'can create product' do
    visit 'products/'
    expect(page).to have_link 'Create'
    click_on 'Create'
    expect(page).to have_content 'Products#new'
    fill_in 'Title', with: 'Jquery book'
    click_on 'submit'
  end
  it 'can edit product' do
    visit 'products/'
    first(:link, "Edit").click
    expect(page).to have_content 'edit.html.erb'
    fill_in 'Title', with: 'hello'
    click_on 'submit'
    expect(page).to have_content 'Update sucessfully'
  end
  it 'can delete product' do
    visit 'products/'
    first(:link, 'Delete').click
    expect(page).to have_content 'Delete sucessfully'
  end
  # let!(:products) { create_list(:product, 5) }
  it 'can show product' do
    visit 'products/'
    first(:link, 'Readmore').click
    expect(page).to have_content product.title
  end
end
