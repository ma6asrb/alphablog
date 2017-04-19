class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def new
     @article = Article.new
  end

  def edit
  end
  
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  
  def update
    if @article.update(article_params)
      flash[:success] = "Artcile was updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def show
    ap @article
  end
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def destroy
    @article.destroy
    flash[:danger] = "Artcile was fully deleted"
    redirect_to articles_path
  end
  
  
  private
    def article_params
      # Whitelist parameters
      params.require(:article).permit(:title, :description)
    end
    
    def set_article
      @article = Article.find(params[:id])
    end
  
    def require_same_user
      if current_user != @article.user and !current_user.admin?
        flash[:danger] = "You can only edit or delete your own article"
        redirect_to root_path
      end
    end

  
end