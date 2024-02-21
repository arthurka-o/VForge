# frozen_string_literal: true

class CreateUserTraitCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :user_trait_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
