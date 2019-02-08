class GossipsController < ApplicationController
  include SessionsHelper


  def new
   @gossip = Gossip.new
  end


  def show
    @gossip = Gossip.find(params[:id])
    @comment = @gossip.comments
  end

   def create
    @gossip = Gossip.new('content' => params[:content],'title' => params[:title])
    @gossip.user = current_user

      if @gossip.save
        flash[:notice] = "Post successfully created"
        redirect_to root_path
      else
        render 'new'
      end
   end

   def index
    @gossip = Gossip.all
  end

  def edit
  @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(gossip_params)
      flash[:notice] = "Post successfully modified"
      flash[:type] = "info"
      redirect_to gossip_path
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
    p "$" * 150
    puts params
    p "$" * 150
    @gossip.destroy
    flash[:notice] = "Post successfully destroy"
    flash[:type] = "info"
    redirect_to root_path
  end

  # def authenticate_user
  #   unless current_user
  #     flash[:danger] = "Please log in."
  #     redirect_to new_session_path
  #   end
  # end
  #
  # def user_match
  #   @gossip = Gossip.find(params[:id])
  #   unless current_user.id == @gossip.user.id
  #     flash[:danger] = "You are not allowed."
  #     redirect_to root_path
  #   end
  # end


end
