# require 'rails_helper'
#
# describe 'CRUD product', type: :feature do
#   let!(:product) {create(:product, title: 'asdasd')}
#
#   it 'can create product' do
#     visit 'products/'
#     expect(page).to have_link 'Create'
#     click_on 'Create'
#     expect(page).to have_content 'Products#new'
#     fill_in 'Title', with: 'Jquery book'
#     click_on 'submit'
#   end
#   it 'can edit product' do
#     visit edit_product_path(product.id)
#     # expect(page).to have_selector('a', text: 'Edit')
#     expect(page).to have_content 'edit.html.erb'
#     fill_in 'Title', with: 'asd'
#     click_on 'submit'
#     visit product_path(product.id)
#     expect(page).to have_content product.reload.title
#   end
#   it 'can delete product' do
#     visit 'products/'
#     expect(page).to have_content product.reload.title
#     click_on 'Delete'
#     save_and_open_page
#     expect(page).to have_content 'Delete sucessfully'
#   end
# end
