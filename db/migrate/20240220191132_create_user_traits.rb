# frozen_string_literal: true

class CreateUserTraits < ActiveRecord::Migration[7.1]
  def change
    create_table :user_traits do |t|
      t.references :user_trait_categories, null: false, foreign_key: true
      t.string :name
      t.text :value

      t.timestamps
    end
  end
end
