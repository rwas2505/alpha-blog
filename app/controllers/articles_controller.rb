class ArticlesController < ApplicationController
  def show
    # byebug
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new()
  end

  def edit
    # byebug
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article]
    @article = Article.new(params.require(:article).permit(:title, :description))
    # render plain: @article.inspect
    if @article.save
      #save the key of notice and value of "Article was crea... to the flash hash if article saves"
      flash[:notice] = "Article was created successfully."
      # redirect_to article_path(@article) //the below code is shorthand for this line
      redirect_to @article
    else
      render 'new' #and show errors at top of new.html.erb
    end
  end

  def update
    # byebug
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end


  
  
end