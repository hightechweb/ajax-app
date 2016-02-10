class PostsController < ApplicationController
  # devise, prevent users from accessing ALL post actions before login
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    # @post = Post.new DEVISE BELOW
    @post = current_user.posts.build
  end

  # POST /posts
  # POST /posts.json
  def create
    # @post = Post.create(post_params) DEVISE BELOW
    @post = current_user.posts.build(post_params)
    # @post.user = User.first DEVISE ABOVE

    respond_to do |format|
      if @post.save
        @created = true
        format.json { head :no_content }
        format.js
        # format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
        @created = false
        # format.json { render json: @post.errors.full_messages, status: :unprocessable_entity }
        format.html { render :new }
        format.js
      end
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @post.errors.full_messages, status: :unprocessable_entity }
      end

    end
  end


  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end


  def search
    if params[:post]
      # @post = Post.find_by_title(params[:post]) #SEE post.rb file
      @post = Post.find_user_posts_by_title(params[:post], params[:user_id])
      # @post ||= Post.new_from_lookup(params[:post])
    end

    if @post
      # render json: @poste
      render partial: 'lookup'
    else
      render status: :not_found, nothing: true
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

end
