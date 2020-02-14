class AddTwoColumnToTextBlock < ActiveRecord::Migration[6.0]
  def change
    add_column :text_blocks, :two_column, :boolean, default: false, null: false
  end
end
