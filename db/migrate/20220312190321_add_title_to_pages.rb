# frozen_string_literal: true

class AddTitleToPages < ActiveRecord::Migration[7.0]
  def change
    change_table :pages do |t|
      t.string :title
    end
  end
end
