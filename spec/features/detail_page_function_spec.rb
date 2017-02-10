require 'rails_helper'

describe 'the detail page path' do
  it "will render the details page" do
    Product.create(name: 'Twix', cost: '2.25', country: 'USA')
    visit products_path
    click_on 'Twix'
    expect(page).to have_content 'Twix'
  end
end
