class User < ApplicationRecord
  has_many :products
  validates :email, presence: true, format: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/
end
