class RemoveColumnCreatedAtFromResponses < ActiveRecord::Migration
  def change
    remove_column(:responses, :created_at)
  end
end
