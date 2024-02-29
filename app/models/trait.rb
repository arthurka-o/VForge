# frozen_string_literal: true

class Trait < ApplicationRecord
  belongs_to :profile

  enum category: {
    basic: "basic",
    interest: "interest",
    prompt: "prompt",
    language: "language"
  }

  normalizes :name, with: -> { _1.strip.downcase }

  after_create_commit { broadcast_append_to "traits" }
end
