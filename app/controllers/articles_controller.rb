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

=begin
  We have to specify what data or what exact parameters should be submitted when we create a new article so that a malicious user cannot submit extra form
  fields and overwrite private data. We specify the parameters here also so that we don't have to individually type them out in Article.new.

  The require method ensures that a specific parameter is present, and if it's not provided, the require method throws an error.
  The permit method returns a copy of the parameters object, returning only the permitted keys and values.
=end
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
