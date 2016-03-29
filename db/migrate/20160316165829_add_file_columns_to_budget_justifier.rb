class AddFileColumnsToBudgetJustifier < ActiveRecord::Migration
  def up
    add_attachment :budget_justifiers, :file
  end

  def down
    remove_attachment :budget_justifiers, :file
  end
end
