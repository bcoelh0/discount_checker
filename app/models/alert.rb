class Alert < ApplicationRecord
  has_one :product, dependent: :destroy
  belongs_to :user
  validates :product, presence: true
  validates :user, presence: true
  validates :name, presence: true
  validate :product_url_for_user
  validates_associated :product # prevents alert from being saved if product can't be saved

  private

  def product_url_for_user
    same_product = user.products.select{ |p| p.url == self.product.url }
    errors.add(:product_url, "You already have this product created!") if same_product.count > 0
  end
end
