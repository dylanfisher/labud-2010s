class CreatePulloutCardBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :pullout_card_blocks do |t|
      t.text :text
      t.integer :text_size
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('PulloutCardBlock')
          BlockKind.create name: 'PulloutCardBlock',
                           record_type: 'default',
                           category: 'Text',
                           description: 'A pull out card block with variable text size'
        end
      end

      change.down do
        BlockKind.where(name: 'PulloutCardBlock').destroy_all
      end
    end
  end
end
