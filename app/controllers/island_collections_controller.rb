class IslandCollectionsController < ApplicationController
  include Secured

  before_action :set_island_collection, only: [:show, :edit, :update, :destroy]


  # GET /island_collections
  # GET /island_collections.json
  def index
    @island_collections = IslandCollection.all
  end

  # GET /island_collections/1
  # GET /island_collections/1.json
  def show
    @island_collection = IslandCollection.includes(:collectibles).find(params[:id])
    @proto_collectible = @island_collection.collectibles.first
    @collectibles = @island_collection.collectibles.includes(:collectible_attributes)
    collectible_attribute_class_names = []
    @proto_collectible.collectible_attributes.each do |collectible_attribute|
      collectible_attribute_class_names.push collectible_attribute.collectible_attribute_value.class.to_s
    end
    @collectible_filters = CollectibleFilter.where(collectible_attribute_class_name: collectible_attribute_class_names)
    @collectible_attribute_class_names = collectible_attribute_class_names #TODO remove this line later
    
    if params[:filter] && params[:filter] == 'current_month'
      @collectibles = @island_collection.collectibles.select{|collectible| collectible.active_in(DateTime::MONTHNAMES[DateTime.current.month])}
    else
      @collectibles = @island_collection.collectibles.includes(:collectible_attributes)
    end
    
    @collectibles = @collectibles.sort_by{|obj| obj.position}
    if params[:sort_by] && params[:order] == 'asc'
      @collectibles = @collectibles.sort_by{|collectible| 
        collectible.collectible_attributes.find_by(collectible_attribute_type: CollectibleAttributeType.find_by(name: params[:sort_by]))
       }
    elsif params[:sort_by] && params[:order] == 'desc'
      @collectibles = @collectibles.sort_by{|collectible| 
        collectible.collectible_attributes.find_by(collectible_attribute_type: CollectibleAttributeType.find_by(name: params[:sort_by]))
      }.reverse!
    end

    
  end

  # GET /island_collections/new
  def new
    @island_collection = IslandCollection.new
  end

  # GET /island_collections/1/edit
  def edit
    @island_collection = IslandCollection.find(params[:id])

    @collectibles = @island_collection.collectibles.includes(:collectible_attributes)

  end

  # POST /island_collections
  # POST /island_collections.json
  def create
    @island_collection = IslandCollection.new(island_collection_params)

    respond_to do |format|
      if @island_collection.save
        format.html { redirect_to @island_collection, notice: 'Island collection was successfully created.' }
        format.json { render :show, status: :created, location: @island_collection }
      else
        format.html { render :new }
        format.json { render json: @island_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /island_collections/1
  # PATCH/PUT /island_collections/1.json
  def update
    respond_to do |format|
      if @island_collection.update(island_collection_params)
        format.html { redirect_to @island_collection, notice: 'Island collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @island_collection }
      else
        format.html { render :edit }
        format.json { render json: @island_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /island_collections/1
  # DELETE /island_collections/1.json
  def destroy
    @island_collection.destroy
    respond_to do |format|
      format.html { redirect_to island_collections_url, notice: 'Island collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /island_collections/set_modal/1
  def set_modal
    @collectible = Collectible.find(params[:id])
    respond_to do |format|
        format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_island_collection
      @island_collection = IslandCollection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def island_collection_params
      params.require(:island_collection).permit(:title, :thumbnail, :collectibles_attributes => [:island_collection_id, :name, :thumbnail, :complete, :id])
    end
end
