class Users::ArticlesController < ApplicationController
  before_action :set_article, only:[:show, :edit, :update, :destroy]

  def index
    @articles = current_user.article
  end  

  def new    
    @article = current_user.article.new
  end

  def create          
    @article = current_user.article.new(article_params)    
    if @article.save
      redirect_to users_articles_url
    else
      render :new
    end
  end
    
  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to users_articles_url 
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to users_articles_path
  end  

  private

    def set_article
      @article = current_user.article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content, :image)
    end
end