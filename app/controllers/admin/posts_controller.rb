class Admin::PostsController < Admin::ForestController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = apply_scopes(Post).by_id.page(params[:page])
    unless current_user.admin?
      @posts = @posts.by_user(current_user)
    end
  end

  def show
    authorize @post
  end

  def new
    @post = Post.new
    authorize @post
  end

  def edit
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post

    @post.user = current_user

    if @post.save
      redirect_to edit_admin_post_path(@post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @post

    if @post.update(post_params)
      redirect_to edit_admin_post_path(@post), notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to admin_posts_url, notice: 'Post was successfully destroyed.'
  end

  private

    def post_params
      # Add blockable params to the permitted attributes if this record is blockable `**BlockSlot.blockable_params`
      params.require(:post).permit(:slug, :status, :title, :user_id, :media_item_id, **BlockSlot.blockable_params)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
