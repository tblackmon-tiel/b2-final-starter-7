class Invoice < ApplicationRecord
  validates_presence_of :status,
                        :customer_id

  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items
  has_many :bulk_discounts, through: :merchants

  enum status: [:cancelled, :in_progress, :completed]

  def total_revenue
    invoice_items.sum("unit_price * quantity")
  end

  def discounted_revenue
    Invoice.find_by_sql(
      "select SUM(quantity * unit_price * (1.0 - biggest_discount / 100.0)) as revenue from (
        select invoice_items.id, invoice_items.quantity, invoice_items.unit_price, MAX(bulk_discounts.percent) as biggest_discount from invoices 
          join invoice_items on invoices.id = invoice_items.invoice_id 
          join items on items.id = invoice_items.item_id 
          join merchants on merchants.id = items.merchant_id 
          join bulk_discounts on merchants.id = bulk_discounts.merchant_id
        where invoice_id = #{self.id} and invoice_items.quantity > bulk_discounts.quantity
        group by invoice_items.id
        ) as discounts"
    ).first
  end

  def standard_revenue
    invoice_items.joins(:bulk_discounts).where("invoice_items.quantity < bulk_discounts.quantity").sum("invoice_items.unit_price * invoice_items.quantity")
  end

  def total_discounted_revenue
    self.discounted_revenue.revenue + self.standard_revenue
  end
end
