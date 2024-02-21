# frozen_string_literal: true

class User
  class Trait < ApplicationRecord
    belongs_to :user

    enum category: {
      basic: 'basic',
      interest: 'interest',
      prompt: 'prompt',
      language: 'language'
    }
  end
end
