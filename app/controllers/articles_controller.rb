class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      @articles = user.articles.uniq.order(:title)
    else
      @articles = Article.all.order(:title)
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
    @revision = @article.revisions.build
  end

  # GET /articles/1/edit
  def edit
    @revision = @article.current_rev
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @revision = @article.revisions.build(revision_params)
    @revision.user = current_user
    update_article_categories

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    update_article_categories
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title)
    end

    def revision_params
      params.require(:revision).permit(:content, :article_id, :image_url)
    end

    def update_article_categories
    category_titles = params[:article][:category_titles].split(",")
    category_titles.each do |category_title|
      category_title = category_title.strip
      category = Category.find_by(title: category_title)
      category ||= Category.new(title: category_title)
      @article.categories << category unless @article.categories.exists?(category)
    end
  end
end
