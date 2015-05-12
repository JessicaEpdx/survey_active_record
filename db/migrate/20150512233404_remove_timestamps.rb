class RemoveTimestamps < ActiveRecord::Migration
  def change
    remove_column(:responses, :updated_at)
  end
end
