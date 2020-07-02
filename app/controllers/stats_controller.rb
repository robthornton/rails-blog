class StatsController < ApplicationController
  def index
    authors_stats
    tags_stats
  end

  private

  def authors_stats
    @authors_stats = Hash.new(0)
    Post.all.each do |p|
      @authors_stats[p.user.name] += 1
    end
  end

  def posts_stats
    @posts_stats = Hash.new(0)
    Comment.all.each do |c|
      @posts_stats[c.user.name] += 1
    end
  end

  def tags_stats
    @tags_stats = Hash.new(0)
    Tag.all.each do |t|
      @tags_stats[t.name] += t.post.count
    end
  end
end
