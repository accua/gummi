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

  it "will throw an error if a name is not entered" do
    visit products_path
    fill_in 'product[name]', with: ''
    fill_in 'product[cost]', with: '2.25'
    fill_in 'product[country]', with: 'United States'
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end

  it "will throw an error if a cost is not entered" do
    visit products_path
    fill_in 'product[name]', with: 'Snickers'
    fill_in 'product[cost]', with: ''
    fill_in 'product[country]', with: 'United States'
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end

  it "will throw an error if a country is not entered" do
    visit products_path
    fill_in 'product[name]', with: 'Snickers'
    fill_in 'product[cost]', with: '1.25'
    fill_in 'product[country]', with: ''
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end

  it "will delete the product" do
    prod = Product.create(name: 'Twix', cost: '2.25', country: 'USA')
    visit product_path(prod)
    click_on 'Delete Product'
    expect(page).to have_content 'Gummi Bear Kingdom'
  end

  it "will take the user to the product list from the detail page" do
    prod = Product.create(name: 'Twix', cost: '2.25', country: 'USA')
    visit product_path(prod)
    click_on 'Return to product list'
    expect(page).to have_content 'Gummi Bear Kingdom'
  end
end
