class ArticleNotesController < ApplicationController
  
  before_action :find_article
  before_action :set_article_note, only: [:edit, :update]
  
  def index
  end

  def edit
  end
  
  
  def new
    @article_note = @article.article_notes.new
  end

  def create
    @article_note = ArticleNote.new(note_params)
    @article_note.user = current_user
    @article_note.article_id = @article.id
    
    if @article_note.save
      flash[:success] = "Note was created successfully"
      redirect_to article_path(@article)
    else
      flash[:danger] = "Note NOT created"
      render 'new'
    end
  end
  
  def update
    if @article_note.update(note_params)
      flash[:success] = "Note was updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end


  def show
    
  end

  private
  def note_params
    params.require(:article_note).permit(:article_id, :note)
  end
  
  def find_article
    @article = Article.find(params[:article_id])
  end

  def set_article_note
    @article_note = ArticleNote.find(params[:id])
  end



end