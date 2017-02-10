require 'rails_helper'

describe 'the routes from navbar buttons process' do
  it "takes the user home" do
    visit products_path
    click_link 'Gummi Bear Kingdom'
    expect(page).to have_content 'Welcome to The Gummi Bear Kingdom'
  end

  it "takes the user to the products page" do
    Product.create(name: 'Twix', cost: 1.25, country: 'USA')
    visit root_path
    click_link 'Products'
    expect(page).to have_content 'Twix'

  end
end
