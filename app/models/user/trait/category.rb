# frozen_string_literal: true

class User
  class Trait
    class Category < ApplicationRecord
      has_many :traits, class_name: 'User::Trait', foreign_key: 'user_trait_categories_id', dependent: :destroy

      enum name: {
        basic: 'basic',
        interest: 'interest',
        prompt: 'prompt',
        language: 'language'
      }
    end
  end
end
