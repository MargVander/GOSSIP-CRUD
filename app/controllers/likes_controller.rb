class LikesController < ApplicationController
  include SessionsHelper

  before_action :find_gossip
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:danger] = "You can't like more than once"
    else
      @gossip.likes.create(user_id: current_user.id)
    end
    redirect_to request.referrer
  end

  # def destroy
  # if !(already_liked?)
  #   flash[:notice] = "Cannot unlike"
  # else
  #   @gossip.destroy
  # end
  # redirect_to root_path
  # end



    private
  def find_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, likeable:
      params[:gossip_id]).exists?
    end

    def find_like
       @like = @gossip.likes.find(params[:id])
    end

end
