class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table(:posts) do |t|
      t.text(:body, null: false)
      t.references(:user, foreign_key: true)

      t.timestamps
    end

    change_table(:comments) do |t|
      t.references(:post, foreign_key: true)
    end

    create_table(:posts_tags, id: false) do |t|
      t.references(:post, foreign_key: true)
      t.references(:tag, foreign_key: true)
    end
  end
end
