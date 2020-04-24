class CollectibleAttributeListItemsController < ApplicationController
  before_action :set_collectible_attribute_list_item, only: [:show, :edit, :update, :destroy]

  # GET /collectible_attribute_list_items
  # GET /collectible_attribute_list_items.json
  def index
    @collectible_attribute_list_items = CollectibleAttributeListItem.all
  end

  # GET /collectible_attribute_list_items/1
  # GET /collectible_attribute_list_items/1.json
  def show
  end

  # GET /collectible_attribute_list_items/new
  def new
    @collectible_attribute_list_item = CollectibleAttributeListItem.new
  end

  # GET /collectible_attribute_list_items/1/edit
  def edit
  end

  # POST /collectible_attribute_list_items
  # POST /collectible_attribute_list_items.json
  def create
    @collectible_attribute_list_item = CollectibleAttributeListItem.new(collectible_attribute_list_item_params)

    respond_to do |format|
      if @collectible_attribute_list_item.save
        format.html { redirect_to @collectible_attribute_list_item, notice: 'Collectible attribute list item was successfully created.' }
        format.json { render :show, status: :created, location: @collectible_attribute_list_item }
      else
        format.html { render :new }
        format.json { render json: @collectible_attribute_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collectible_attribute_list_items/1
  # PATCH/PUT /collectible_attribute_list_items/1.json
  def update
    respond_to do |format|
      if @collectible_attribute_list_item.update(collectible_attribute_list_item_params)
        format.html { redirect_to @collectible_attribute_list_item, notice: 'Collectible attribute list item was successfully updated.' }
        format.json { render :show, status: :ok, location: @collectible_attribute_list_item }
      else
        format.html { render :edit }
        format.json { render json: @collectible_attribute_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collectible_attribute_list_items/1
  # DELETE /collectible_attribute_list_items/1.json
  def destroy
    @collectible_attribute_list_item.destroy
    respond_to do |format|
      format.html { redirect_to collectible_attribute_list_items_url, notice: 'Collectible attribute list item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collectible_attribute_list_item
      @collectible_attribute_list_item = CollectibleAttributeListItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collectible_attribute_list_item_params
      params.require(:collectible_attribute_list_item).permit(:collectible_attribute_list_id, :position)
    end
end
