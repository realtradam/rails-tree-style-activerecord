class AddNodeIdToNodes < ActiveRecord::Migration[6.0]
  def change
    add_column :nodes, :node_id, :integer
  end
end
