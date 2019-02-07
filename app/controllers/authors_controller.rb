class AuthorsController < ApplicationController

  include SessionsHelper

  def index

  end
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create('first_name' => params[:first_name], 'last_name' => params[:last_name], city_id: 3, 'age' => params[:age], 'description' => params[:description], 'email' => params[:email], 'password' => params[:password])


      if @user.save
        flash[:notice] = "Post successfully created"
        log_in(@user)# check method helper

        redirect_to root_path
      else
        render 'new'
      end
  end
end
