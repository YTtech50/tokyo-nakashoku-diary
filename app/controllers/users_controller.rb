class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @foods = user.foods
    @p = Food.ransack(params[:q])  # 検索オブジェクトを生成
  end  
end
