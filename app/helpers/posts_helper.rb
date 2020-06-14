module PostsHelper
  def tags_for(post:)
    post.tags.map(&:name).join(' ')
  end
end
