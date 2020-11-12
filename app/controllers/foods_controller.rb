class FoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  before_action :search_food, only: [:index, :search, :show]

  def index
    @newfoods = Food.includes(:user).where(created_at: Time.now.beginning_of_week..Time.now.end_of_week)
    @goodfoods = Food.includes(:user).where(evaluation_id: 2)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @food.comments.includes(:user)
    @results = @p.result.includes(:user) 
  end

  def edit
    if @food.user == current_user 
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    if @food.update(food_params)
      redirect_to food_path
    else
      render :edit
    end
  end

  def destroy
    if @food.user == current_user
      @food.destroy
      redirect_to root_path
    end
  end

  def search
    @foods = Food.search(params[:keyword])
    @results = @p.result.includes(:user)  # 検索条件にマッチした商品の情報を取得
  end

  private

  def food_params
    params.require(:food).permit(:food_name, :restaurant, :review, :category_id, :area_id, :business_form_id, :evaluation_id, :price, :calorie, :image, :start_time).merge(user_id: current_user.id)
  end

  def set_food
    @food = Food.find(params[:id])
  end

  def search_food
    @p = Food.ransack(params[:q])  # 検索オブジェクトを生成
  end
end
