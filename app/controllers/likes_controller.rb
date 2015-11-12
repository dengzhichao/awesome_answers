class LikesController < ApplicationController

  before_action :authenticate_user

  # POST /questions/12/likes
  def create
    like = Like.new
    question = Question.find(params[:question_id])
    like.question = question
    like.user = current_user
    if like.save
      redirect_to question_path(question), notice: "Thanks for liking!"
    else
      redirect_to question_path(question), alert: "You already liked this!"
    end
  end

  def destroy
    question = Question.find params[:question_id]
    like = current_user.likes.find params[:id]
    like.destroy
    redirect_to question_path(question), notice: "Like removed!"
  end

end
