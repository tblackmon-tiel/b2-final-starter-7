require 'rails_helper'

RSpec.describe "merchant's bulk discount new page", type: :feature do
  before(:each) do
    @merchant1 = Merchant.create!(name: "Hair Care")

    visit new_merchant_bulk_discount_path(@merchant)
  end

  describe "When I visit the merchant's bulk discount new page" do
    it "has a form to create a new bulk discount that redirects back to the merchant's bulk discount index page" do
      expect(page).to have_field("percent")
      expect(page).to have_field("quantity")
      expect(page).to have_button("Create Discount")

      fill_in "percent", with: 20
      fill_in "quantity", with: 12
      click_button "Create Discount"

      expect(page).to have_current_path("/merchants/#{@merchant1.id}/bulk_discounts")
      expect(page).to have_content("Discount percent: 20%")
      expect(page).to have_content("Quantity threshold: 12 items")
    end
  end
end