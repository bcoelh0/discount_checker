class User < ApplicationRecord
  has_many :alerts, dependent: :destroy
  validates :email, presence: true, format: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/

  def products
    alerts.map(&:product)
  end
end
