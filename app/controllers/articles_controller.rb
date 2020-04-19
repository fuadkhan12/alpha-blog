class ArticlesController < ApplicationController
  before_action :set_article, except: [:index, :new, :create]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(set_permitted_params)
    if(@article.save)
      flash[:notice] = "Article was created successfully!"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if(@article.update(set_permitted_params))
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
    def set_permitted_params
      params.require(:article).permit(:title, :description)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
