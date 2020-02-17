class HomePagesController < PagesController
  def show
    @posts = Post.includes(:media_item, :user).all.published.by_username
    @no_header = true
  end
end
