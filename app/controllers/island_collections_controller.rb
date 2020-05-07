class IslandCollectionsController < ApplicationController
  include Secured

  before_action :set_island_collection, only: [:show, :edit, :update, :destroy]


  # GET /island_collections
  # GET /island_collections.json
  def index
    @user = User.find_by(auth0_id: session[:userinfo]['uid'])
    @island_collections = @user.island_collections
  end

  # GET /island_collections/1
  # GET /island_collections/1.json
  def show
    @island_collection = IslandCollection.includes(:collectibles).friendly.find(params[:id])
    
    if params[:filter]
      @collectibles = @island_collection.collectibles.select{|collectible|
        
        current_month = true
        complete = true
        not_complete = true
        current_time = true
        specific_month = true
        specific_time = true

        if params[:filter].include?('current_month')
          current_month = collectible.active_in(month: DateTime::MONTHNAMES[DateTime.current.month])
        end

        if params[:filter] =~ /(?:^|\W)complete(?:$|\W)/
          complete = collectible.complete
        end

        if params[:filter] =~ /(?:^|\W)not_complete(?:$|\W)/
          not_complete = !collectible.complete
        end

        if params[:filter] =~ /(?:^|\W)not_complete(?:$|\W)/ && params[:filter] =~ /(?:^|\W)complete(?:$|\W)/
          complete = true
          not_complete = true
        end

        if params[:filter].include?('current_time')
          current_time = collectible.active_at_time(time: Time.current)
        end

        months_to_check = params[:filter].scan(Regexp.union(DateTime::MONTHNAMES[1..12].map(&:downcase)))
        if months_to_check.size > 0
          specific_month = false
          months_to_check.each do |month_name|
            if collectible.active_in(month: month_name.capitalize)
              specific_month = true
            end
          end
        end

        times_to_check = params[:filter].scan(/(?:^|\W)\d+[ap]m(?:$|\W)/)
        if times_to_check.size > 0
          specific_time = false
          times_to_check.each do |time|
            if collectible.active_at_time(time: Time.now.change(hour: time))
              specific_time = true
            end
          end
        end

        current_month && complete && not_complete && current_time && specific_month && specific_time
      }
    else
      @collectibles = @island_collection.collectibles.includes(:collectible_attributes)
    end
    
    @collectibles = @collectibles.sort_by{|obj| obj.position}
    if params[:sort_by]
      if params[:sort_by] == "Name"
        @collectibles = @collectibles.sort_by{ |collectible| collectible.name }
      elsif params[:sort_by] == "Collected"
        @collectibles = @collectibles.sort_by{ |collectible| collectible.complete ? 0 : 1 }
      else
        @collectibles = @collectibles.sort_by{|collectible| 
          collectible.collectible_attributes.find_by(collectible_attribute_type: CollectibleAttributeType.find_by(name: params[:sort_by]))
         }
      end
      if params[:order] =='desc'
        @collectibles.reverse!  
      end
    end
    

    
  end

  # GET /island_collections/new
  def new
    @island_collection = IslandCollection.new
  end

  # GET /island_collections/1/edit
  def edit
    @island_collection = IslandCollection.friendly.find(params[:id])

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
      @island_collection = IslandCollection.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def island_collection_params
      params.require(:island_collection).permit(:title, :thumbnail, :collectibles_attributes => [:island_collection_id, :name, :thumbnail, :complete, :id])
    end
end
