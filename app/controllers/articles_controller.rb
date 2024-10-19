class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @categories = Category.all
    @conditions = Condition.all
    @shopping_costs = ShoppingCost.all
    @shopping_origins = ShoppingOrigin.all
    @shopping_days = ShoppingDay.all
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      @categories = Category.all
      @conditions = Condition.all
      @shopping_costs = ShoppingCost.all
      @shopping_origins = ShoppingOrigin.all
      @shopping_days = ShoppingDay.all
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:category_id, :condition_id, :shopping_cost_id, :shopping_origin_id, :shopping_day_id)
  end
end
