class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    # Instantiates a new article but does not save it. By default, this action will render app/views/articles/new.html.erb
    @article = Article.new 
  end

  def create
    # Instantiates a new article and attempts to save it
    @article = Article.new(title: "...", body: "...")

    if @article.save
      # If article is saved successfully, redirect to http://localhost:3000/articles/#{@article.id}
      redirect_to @article
    else
      # If not, render/re-display the form. Use render instead of redirect otherwise browser will make the same unsuccessful request again.
      render :new, status: :unprocessable_entity
    end
  end
end
