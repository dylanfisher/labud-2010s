class PostsController < ForestController
  before_action :set_post, only: [:show]

  def show
    authorize @post
    @user = @post.user
  end

  private

    def set_post
      @post = Post.find_by!(slug: params[:id])
    end
end
