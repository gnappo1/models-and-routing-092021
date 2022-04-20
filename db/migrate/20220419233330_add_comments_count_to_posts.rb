class AddCommentsCountToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :comments_count, :integer, default: 0, null: false

    reversible do |dir|
      dir.up {data}
    end
  end

  def data
    #squish: Returns the string, first removing all whitespace on both ends of the string, and then changing remaining consecutive whitespace groups into one space each.
    #count(1) is the same of count(*), meaning it counts all the rows!
    execute <<-SQL.squish
      UPDATE posts
        SET comments_count = (
          SELECT COUNT(1)
          FROM comments
          WHERE comments.post_id = posts.id
        )
    SQL
  end
end
