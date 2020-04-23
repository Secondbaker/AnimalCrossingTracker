class CollectibleAttributeListsController < ApplicationController
  before_action :set_collectible_attribute_list, only: [:show, :edit, :update, :destroy]

  # GET /collectible_attribute_lists
  # GET /collectible_attribute_lists.json
  def index
    @collectible_attribute_lists = CollectibleAttributeList.all
  end

  # GET /collectible_attribute_lists/1
  # GET /collectible_attribute_lists/1.json
  def show
  end

  # GET /collectible_attribute_lists/new
  def new
    @collectible_attribute_list = CollectibleAttributeList.new
  end

  # GET /collectible_attribute_lists/1/edit
  def edit
  end

  # POST /collectible_attribute_lists
  # POST /collectible_attribute_lists.json
  def create
    @collectible_attribute_list = CollectibleAttributeList.new(collectible_attribute_list_params)

    respond_to do |format|
      if @collectible_attribute_list.save
        format.html { redirect_to @collectible_attribute_list, notice: 'Collectible attribute list was successfully created.' }
        format.json { render :show, status: :created, location: @collectible_attribute_list }
      else
        format.html { render :new }
        format.json { render json: @collectible_attribute_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collectible_attribute_lists/1
  # PATCH/PUT /collectible_attribute_lists/1.json
  def update
    respond_to do |format|
      if @collectible_attribute_list.update(collectible_attribute_list_params)
        format.html { redirect_to @collectible_attribute_list, notice: 'Collectible attribute list was successfully updated.' }
        format.json { render :show, status: :ok, location: @collectible_attribute_list }
      else
        format.html { render :edit }
        format.json { render json: @collectible_attribute_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collectible_attribute_lists/1
  # DELETE /collectible_attribute_lists/1.json
  def destroy
    @collectible_attribute_list.destroy
    respond_to do |format|
      format.html { redirect_to collectible_attribute_lists_url, notice: 'Collectible attribute list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collectible_attribute_list
      @collectible_attribute_list = CollectibleAttributeList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collectible_attribute_list_params
      params.fetch(:collectible_attribute_list, {})
    end
end
