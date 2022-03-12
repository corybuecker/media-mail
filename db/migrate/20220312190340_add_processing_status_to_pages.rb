# frozen_string_literal: true

class AddProcessingStatusToPages < ActiveRecord::Migration[7.0]
  def change
    create_enum :processing_statuses, %w[unprocessed fetched parsed sent]

    change_table :pages do |t|
      t.enum :processing_status, enum_type: 'processing_statuses', default: 'unprocessed', null: false
    end
  end
end
