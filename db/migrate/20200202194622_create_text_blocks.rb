class CreateTextBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :text_blocks do |t|
      t.text :text
      t.integer :text_size
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('TextBlock')
          BlockKind.create name: 'TextBlock',
                           record_type: 'default',
                           category: 'Text',
                           description: 'Text block with variable text size'
        end
      end

      change.down do
        BlockKind.where(name: 'TextBlock').destroy_all
      end
    end
  end
end
