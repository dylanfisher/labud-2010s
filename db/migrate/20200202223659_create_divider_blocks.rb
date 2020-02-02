class CreateDividerBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :divider_blocks do |t|
      t.timestamps
    end

    reversible do |change|
      change.up do
        unless BlockKind.find_by_name('DividerBlock')
          BlockKind.create name: 'DividerBlock',
                           record_type: 'default',
                           category: 'Misc',
                           description: 'A horizontal divider line'
        end
      end

      change.down do
        BlockKind.where(name: 'DividerBlock').destroy_all
      end
    end
  end
end
