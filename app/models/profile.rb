# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user
  has_many :traits, dependent: :destroy

  has_one_attached :avatar, dependent: :destroy

  accepts_nested_attributes_for :traits, allow_destroy: true

  def bio
    traits.find_by(name: :bio)&.value
  end
end
