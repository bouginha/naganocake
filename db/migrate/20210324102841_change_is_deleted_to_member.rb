class ChangeIsDeletedToMember < ActiveRecord::Migration[5.2]
  def change
    change_column :members, :is_deleted, :boolean, null: false, default: false
  end
end
