class PressArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /press_articles
  # GET /press_articles.json
  def index
    @press_articles = PressArticle.order("print_date DESC").all().group_by{ |a| a.print_date.nil? ? 0: a.print_date.year }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @press_articles }
    end
  end

  # GET /press_articles/1
  # GET /press_articles/1.json
  def show
    @press_article = PressArticle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @press_article }
    end
  end

  # GET /press_articles/new
  # GET /press_articles/new.json
  def new
    @press_article = PressArticle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @press_article }
    end
  end

  # GET /press_articles/1/edit
  def edit
    @press_article = PressArticle.find(params[:id])
  end

  # POST /press_articles
  # POST /press_articles.json
  def create
    @press_article = PressArticle.new(params[:press_article])

    respond_to do |format|
      if @press_article.save
        format.html { redirect_to @press_article, notice: 'Press article was successfully created.' }
        format.json { render json: @press_article, status: :created, location: @press_article }
      else
        format.html { render action: "new" }
        format.json { render json: @press_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /press_articles/1
  # PUT /press_articles/1.json
  def update
    @press_article = PressArticle.find(params[:id])

    respond_to do |format|
      if @press_article.update_attributes(params[:press_article])
        format.html { redirect_to @press_article, notice: 'Press article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @press_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /press_articles/1
  # DELETE /press_articles/1.json
  def destroy
    @press_article = PressArticle.find(params[:id])
    @press_article.destroy

    respond_to do |format|
      format.html { redirect_to press_articles_url }
      format.json { head :no_content }
    end
  end
end
