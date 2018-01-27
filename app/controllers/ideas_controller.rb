class IdeasController < ApplicationController
  before_action :authenticate_user!

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params.merge({ user_id: current_user.id }))

    if @idea.save
      redirect_to @idea
    else
      render :new
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @rating = Rating.where({
      user_id: current_user.id,
      idea_id: @idea.id
    }).take
  end

  def edit
  end

  def submit_rating
    @idea = Idea.find(params[:id])

    @rating = Rating.where({
      user_id: current_user.id,
      idea_id: @idea.id
    }).take

    if @rating
      @rating.update({
        stars: params[:rating]
      })
    else
      Rating.create(
        user_id: current_user.id,
        stars: params[:rating],
        idea_id: params[:id]
      )
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
