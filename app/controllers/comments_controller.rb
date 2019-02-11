class CommentsController < ApplicationController
  include SessionsHelper

  before_action :set_comment, only: [:show, :edit, :update, :destroy]


  def new
    puts params
    @comment = Comment.new
  end

  def create
    puts params
    @comment = Comment.new(content: params[:content], commenteable_type: "Gossip", commenteable_id: params[:gossip_id] )
    @comment.user = current_user
      if @comment.save
        flash[:notice] = "Comment successfully created"
        flash[:info] = "danger"
        redirect_to gossip_path(params[:gossip_id])
      else
        render 'new'
      end
  end

  def edit
    @gossip = params[:gossip_id]
  end

  def update
    if @comment.update(content: params[:content], commenteable_id: params[:gossip_id], commenteable_type: "Gossip")
      @comment.user = current_user
      p "_-" * 120
      p params
      p "_-" * 120
      flash[:notice] = "Comment successfully modified"
      flash[:type] = "info"
      redirect_to gossip_path(params[:gossip_id])
    else
      render :edit
    end

  end


  # def destroy
  #   @comment = Comment.find(params[:id])
  #   p "^" * 120
  #   p params
  #   p "^" * 120
  #   @comment.destroy
  #   flash[:notice] = "Post successfully destroy"
  #   flash[:type] = "info"
  #   redirect_to root_path
  # end

#   def destroy
#   @gossip = Gossip.find(params[:gossip_id])
#   @comment = @gossip.comments.find(params[:id])
#     p "^" * 120
#     p params
#     p "^" * 120
#   @comment.destroy
#
#   redirect_to article_path(@gossip)
# end

  private

  def set_comment
  @comment = Comment.find(params[:id])
end



end
