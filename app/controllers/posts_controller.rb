class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:edit, :update, :destroy]
  load_and_authorize_resource


  def index

    @posts = Post.all
    @ability = Ability.new(current_user)
    @post = Post.new

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(
        title: params[:post][:title],
        content: params[:post][:content],
        user_id: current_user.id

    )

    grade = current_user.grades.find_by(cls: params[:post][:grade].to_i)
    PostGrade.create(post_id: @post.id, grade_id: grade.id)
    redirect_to action: 'index'


  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post.update(post_params)
    redirect_to action: 'index'

  end

  def destroy
    @post.destroy
    redirect_to action: 'index'
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title,:content)
  end

end

