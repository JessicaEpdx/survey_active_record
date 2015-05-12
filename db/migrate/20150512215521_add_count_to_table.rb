class AddCountToTable < ActiveRecord::Migration
  def change
    add_column(:responses, :count, :int)
  end
end
