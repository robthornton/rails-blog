class StatsController < ApplicationController
  def index
    posts_stats
    tags_stats
  end

  private

  def posts_stats
    @posts_stats = Hash.new(0)
    Post.all.each do |p|
      @posts_stats[p.user.name] += 1
    end
  end

  def tags_stats
    @tags_stats = Hash.new(0)
    Tag.all.each do |t|
      @tags_stats[t.name] += t.post.count
    end
  end
end
