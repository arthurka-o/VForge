class User < ApplicationRecord
  validates :eth_address, uniqueness: true
  validates :eth_nonce, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
