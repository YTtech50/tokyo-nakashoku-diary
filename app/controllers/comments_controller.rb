class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/foods/#{comment.food.id}"  # コメントと結びつくフード投稿の詳細画面に遷移する
  end
    
  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, food_id: params[:food_id])
  end
end
