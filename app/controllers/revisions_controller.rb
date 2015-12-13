class RevisionsController < ApplicationController
  before_action :set_revision, only: [:show, :edit, :update, :destroy]
  before_action :set_article

  # GET /revisions
  # GET /revisions.json
  def index
    @revisions = @article.revisions
  end

  # GET /revisions/1
  # GET /revisions/1.json
  def show
  end

  # GET /revisions/new
  def new
    @revision = Revision.new
  end

  # GET /revisions/1/edit
  def edit
  end

  # POST /revisions
  # POST /revisions.json
  def create
    @revision = @article.revisions.build(revision_params)
    @revision.user = current_user
    if @revision.save
      redirect_to @article
    else
      redirect_to edit_article_path(@article)
    end
  end

  # PATCH/PUT /revisions/1
  # PATCH/PUT /revisions/1.json
  def update
    respond_to do |format|
      if @revision.update(revision_params)
        format.html { redirect_to @revision, notice: 'Revision was successfully updated.' }
        format.json { render :show, status: :ok, location: @revision }
      else
        format.html { render :edit }
        format.json { render json: @revision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /revisions/1
  # DELETE /revisions/1.json
  def destroy
    @revision.destroy
    respond_to do |format|
      format.html { redirect_to revisions_url, notice: 'Revision was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_revision
      @revision = Revision.find(params[:id])
    end

    def set_article
      @article = Article.find(params[:article_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def revision_params
      params.require(:revision).permit(:content, :user_id, :article_id, :image_url)
    end
end
