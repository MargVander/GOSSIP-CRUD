class GossipsController < ApplicationController


  def new
   @gossip = Gossip.new
  end


  def show
    @gossip = Gossip.find(params[:id])
    @comment = @gossip.comments
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
    if @gossip.update(gossip_params)
      flash[:notice] = "Post successfully modified"
      flash[:type] = "info"
      redirect_to root_path
    else
      render :edit
    end
  end

# => Methode pour authorize l'acces a certain element d'un gossip lors d'un form
  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:notice] = "Post successfully destroy"
    flash[:type] = "info"
    redirect_to root_path

  end


end
