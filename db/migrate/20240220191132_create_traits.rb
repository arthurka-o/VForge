# frozen_string_literal: true

class CreateTraits < ActiveRecord::Migration[7.1]
  def change
    create_table :traits do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :category
      t.string :emoji
      t.string :name
      t.text :value

      t.timestamps
    end
  end
end
