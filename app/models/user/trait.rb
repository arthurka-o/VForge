# frozen_string_literal: true

class User
  class Trait < ApplicationRecord
    belongs_to :category, class_name: 'User::Trait::Category', foreign_key: 'user_trait_categories_id'
    has_and_belongs_to_many :users,
                            foreign_key: 'user_trait_id'
  end
end
