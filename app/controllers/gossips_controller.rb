class GossipsController < ApplicationController

  def show
    @gossips = Gossip.find(params[:id])
  end

   def new
    @gossip = Gossip.new
   end

   def create
    @gossip = Gossip.new('content' => params[:content],'title' => params[:title],'user_id' => User.last.id )
      if @gossip.save
        flash[:notice] = "Post successfully created"
        redirect_to root_path
      else
        render 'new'
      end
   end

   def index
    @gossips = Gossip.all
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(tes_params)
      redirect_to @gossip
    else
      render :edit
    end
  end


end
