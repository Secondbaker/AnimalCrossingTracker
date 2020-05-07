class UsersController < ApplicationController
  include Secured
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    unless User.find_by(auth0_id: session[:userinfo]['uid'])
      @user = User.new
    else
      respond_to do |format|
        format.html { redirect_to island_collections_path, notice: 'User already exists.' }
      end
    end 
   
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    if User.find_by(auth0_id: session[:userinfo]['uid'])
      redirect_to island_collections_path, notice: 'User already exists.'
    else
      @user = User.new(user_params)
      @user.auth0_id = session[:userinfo]['uid']
      @user.island_collections << IslandCollection.where(default: true)
      respond_to do |format|
        if @user.save
          format.html { redirect_to island_collections_path, notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :auth0_id)
    end
end
