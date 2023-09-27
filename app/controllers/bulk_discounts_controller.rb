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
    if discount.save
      flash[:success] = ""
      redirect_to merchant_bulk_discounts_path(params[:merchant_id])
    else
      flash[:error] = "The discount could not be created. Please fill out the form entirely!"
      render :new
    end

  end

  def destroy
    discount = BulkDiscount.find(params[:id])
    discount.destroy

    redirect_to merchant_bulk_discounts_path(params[:merchant_id])
  end

  def edit
    @discount = BulkDiscount.find(params[:id])
  end

  def update
    discount = BulkDiscount.find(params[:id])
    discount.update(percent: params[:percent], quantity: params[:quantity])

    redirect_to merchant_bulk_discount_path(params[:merchant_id], params[:id])
  end
end