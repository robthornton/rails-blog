class StatsController < ApplicationController
  def index
    @posts_stats = posts_stats
    # or call them load_*_stats if you want them to set the ivars
    @tags_stats = tags_stats
  end

  private

  def posts_stats
    # SELECT users.id, users.name, COUNT(posts.id) post_count
    # FROM posts
    # INNER JOIN users
    # ON posts.user_id = users.id
    # GROUP BY users.id, users.name

    # Don't do it in memory. Do something like, though you may want a limit or order
    Post
      .references(:user)
      .group(users: [:id, :name])
      .select('COUNT(posts.id) AS post_count', users: [:name])
      .pluck('users.name', 'post_count').to_h
  end

  def tags_stats
    Tag
      .references(:posts)
      .select('COUNT(posts.id) AS post_count', tags: [:name])
      .pluck('tags.name', 'post_count').to_h
  end
end
