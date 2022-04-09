# frozen_string_literal: true

class AddUserIdToLinks < ActiveRecord::Migration[7.0]
  def change
    change_table :links do |t|
      t.references :user, index: true, null: false
    end

    add_foreign_key :links, :users, on_delete: :cascade
  end
end
