class HomePagesController < PagesController
  def show
    @posts = Post.all
  end
end
