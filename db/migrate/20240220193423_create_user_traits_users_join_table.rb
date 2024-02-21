# frozen_string_literal: true

class CreateUserTraitsUsersJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :user_traits, :users do |t|
      t.index :user_trait_id
      t.index :user_id
    end
  end
end
