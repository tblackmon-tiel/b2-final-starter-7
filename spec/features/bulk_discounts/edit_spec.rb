require 'rails_helper'

RSpec.describe "Bulk Discounts edit page", type: :feature do
  before(:each) do
    @merchant1 = Merchant.create!(name: "Hair Care")

    @discount_1 = BulkDiscount.create!(percent: 10, quantity: 10, merchant_id: @merchant1.id)
    @discount_2 = BulkDiscount.create!(percent: 12, quantity: 15, merchant_id: @merchant1.id)

    visit edit_merchant_bulk_discount_path(@merchant1, @discount_1)
  end

  describe "When I visit the merchant's bulk discount edit page" do
    it "I see a form prefilled with the attributes of the bulk discount, to edit the discount" do
      expect(page).to have_field("percent", text: 10)
      expect(page).to have_field("quantity", text: 10)

      fill_in "percent", with: 12
      fill_in "quantity", with: 15
      click_button "Update Bulk Discount"

      expect(page).to have_current_path("/merchants/#{@merchant1.id}/bulk_discounts/#{@discount_1.id}")
      expect(page).to have_content("Discount percent: 12%")
      expect(page).to have_content("Quantity threshold: 15 items")
    end
  end
end