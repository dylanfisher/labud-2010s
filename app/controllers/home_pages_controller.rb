class HomePagesController < PagesController
  def show
    @posts = Post.all
    @no_header = true
  end
end
