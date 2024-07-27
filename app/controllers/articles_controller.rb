class ArticlesController < ApplicationController
  # call a private method find_article before the show, edit, update, and destroy actions
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def show
    # byebug
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    # render plain: params[:article]
    @article = Article.new(article_params)
    @article.user = current_user
    # render plain: @article.inspect
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was deleted successfully."
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
