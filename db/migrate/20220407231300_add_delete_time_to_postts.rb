class AddDeleteTimeToPostts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :delete_time, :datetime
  end
end
