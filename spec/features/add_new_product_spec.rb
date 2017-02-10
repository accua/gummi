require 'rails_helper'

describe 'the add a new item path' do
  it "will add a new item to the database" do
    visit products_path
    fill_in 'product[name]', with: 'Snickers'
    fill_in 'product[cost]', with: '2.25'
    fill_in 'product[country]', with: 'United States'
    click_on 'Create Product'
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
end
