class BulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    @discount = BulkDiscount.find(params[:id])
  end

  def new
    
  end

  def create
    discount = BulkDiscount.new(percent: params[:percent], quantity: params[:quantity], merchant_id: params[:merchant_id])
    discount.save

    redirect_to merchant_bulk_discounts_path(params[:merchant_id])
  end
end