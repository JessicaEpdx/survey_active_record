class BuildTables < ActiveRecord::Migration
  def change
    create_table(:surveys) do |t|
      t.column(:title, :string)

      t.timestamps
    end

    create_table(:questions) do |t|
      t.column(:name, :string)
      t.column(:survey_id, :int)

      t.timestamps
    end
  end
end
