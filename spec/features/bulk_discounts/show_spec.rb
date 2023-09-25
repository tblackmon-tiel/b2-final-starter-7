require 'rails_helper'

RSpec.describe "Bulk Discounts show page", type: :feature do
  before(:each) do
    @merchant1 = Merchant.create!(name: "Hair Care")

    @discount_1 = BulkDiscount.create!(percent: 10, quantity: 10, merchant_id: @merchant1.id)
    @discount_2 = BulkDiscount.create!(percent: 12, quantity: 15, merchant_id: @merchant1.id)

    visit merchant_bulk_discount_path(@merchant1, @discount_1)
  end

  describe "When I visit the merchants bulk discount show page" do
    it "I see the bulk discount's quantity threshold and percentage discount" do
      expect(page).to have_content("Discount percent: #{@discount_1.percent}%")
      expect(page).to have_content("Quantity threshold: #{@discount_1.quantity} items")
    end
  end
end