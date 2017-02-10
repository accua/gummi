require 'rails_helper'

describe 'the detail page path' do
  it "will render the details page" do
    Product.create(name: 'Twix', cost: '2.25', country: 'USA')
    visit products_path
    click_on 'Twix'
    expect(page).to have_content 'Twix'
  end
  it "will update the item" do
    prod = Product.create(name: 'Twix', cost: '2.25', country: 'USA')
    visit product_path(prod)
    fill_in 'product[name]', with: 'Snickers'
    click_on 'Update Product'
    expect(page).to have_content 'Snickers'
  end
end
