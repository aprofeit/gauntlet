class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.belongs_to :objective, index: true
      t.belongs_to :person, index: true

      t.timestamps
    end
  end
end
