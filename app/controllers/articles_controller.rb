class ArticlesController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :search, :show]

  def index
    @title = 'Select the article to read'
    @articles = Article.all
  end

  def new
    @title = 'Create a new article'
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @title = 'Edit article'
    @article = Article.find(params[:id])
  end

  def search
    if params[:search].blank?
      @articles = Article.all
    else
      @title = "You searched : " + params[:search]
      @articles = Article.search(params)
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :picture)
  end
end
