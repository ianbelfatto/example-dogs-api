class AddColumnToDogs < ActiveRecord::Migration[6.1]
  def change
    add_column :dogs, :user_id, :string
  end
end
