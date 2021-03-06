class IslandCollectionsController < ApplicationController
  include Secured

  before_action :set_island_collection, only: [:show, :edit, :update, :destroy]
  before_action :set_user


  # GET /island_collections
  # GET /island_collections.json
  def index
    @island_collections = @user.island_collections
  end

  # GET /island_collections/1
  # GET /island_collections/1.json
  def show
        
    @island_collection = IslandCollection.includes(:collectibles).friendly.find(params[:id])
    
    @collectibles = @island_collection.collectibles.includes(:collectible_attributes)

    if params[:filter]
      
      times_to_check = params[:filter].scan(Regexp.union(TimeOfDay.filters[:active].values))
      months_to_check = params[:filter].scan(Regexp.union(DateTime::MONTHNAMES[1..12].map(&:downcase)))

      if params[:filter].include?('current_month') || months_to_check.size > 0
        @collectibles = @collectibles.select{ |collectible| 
          found = false

          if params[:filter].include?('current_month')
            found = collectible.active_in(month: DateTime::MONTHNAMES[DateTime.current.month])
          end

          months_to_check.each do |month_name|
            unless found
              if collectible.active_in(month: month_name.capitalize)
                found = true
              end
            end
          end

          found
        }
      end
      

      if params[:filter].include?('current_time') || times_to_check.size > 0
        @collectibles = @collectibles.select{ |collectible| 
          found = false

          if params[:filter].include?('current_time') 
            found = collectible.active_at_time(time: Time.current)
          end

          times_to_check.each do |time|
            unless found
              if collectible.active_at_time(time: Time.now.change(hour: DateTime.strptime(time, '%H%P').hour))
                found = true
              end
            end
          end

          found
        }
      end

      if params[:filter] =~ /(?:^|\W)not_complete(?:$|\W)/ && params[:filter] !=~ /(?:^|\W)complete(?:$|\W)/
        @collectibles = @collectibles.select { |collectible|
          !@user.my_collected_collectibles.find_by(collectible_id: collectible.id).completions['first'] == 'true'
        }
      end

      if params[:filter] =~ /(?:^|\W)complete(?:$|\W)/ && params[:filter] !=~ /(?:^|\W)not_complete(?:$|\W)/
        @collectibles = @collectibles.select { |collectible|
        @user.my_collected_collectibles.find_by(collectible_id: collectible.id).completions['first'] == 'true'
        }
      end
    end

    @collectibles = @collectibles.sort_by{|obj| obj.position}
    if params[:sort_by]
      if params[:sort_by] == "Name"
        @collectibles = @collectibles.sort_by{ |collectible| collectible.name }
      elsif params[:sort_by] == "Collected"
        @collectibles = @collectibles.sort_by{ |collectible| @user.my_collected_collectibles.find_by(collectible_id: collectible.id).completions['first'] == 'true' ? 0 : 1 }
      else
        @collectibles = @collectibles.sort_by{|collectible| 
          collectible.collectible_attributes.find_by(label:  params[:sort_by])
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
    @user = User.find(params[:user])
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

    def set_user
      @user = User.find_by(auth0_id: session[:userinfo]['uid'])

      if !@user
        redirect_to new_user_path
      end
    end
end
