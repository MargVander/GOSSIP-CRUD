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

  def edit
  @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    if @gossip.update(gossip_params)
      flash[:notice] = "Post successfully modified"
      flash[:type] = "info"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
  end


end
