class ShadowSizesController < ApplicationController
  before_action :set_shadow_size, only: [:show, :edit, :update, :destroy]

  # GET /shadow_sizes
  # GET /shadow_sizes.json
  def index
    @shadow_sizes = ShadowSize.all
  end

  # GET /shadow_sizes/1
  # GET /shadow_sizes/1.json
  def show
  end

  # GET /shadow_sizes/new
  def new
    @shadow_size = ShadowSize.new
  end

  # GET /shadow_sizes/1/edit
  def edit
  end

  # POST /shadow_sizes
  # POST /shadow_sizes.json
  def create
    @shadow_size = ShadowSize.new(shadow_size_params)

    respond_to do |format|
      if @shadow_size.save
        format.html { redirect_to @shadow_size, notice: 'Shadow size was successfully created.' }
        format.json { render :show, status: :created, location: @shadow_size }
      else
        format.html { render :new }
        format.json { render json: @shadow_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shadow_sizes/1
  # PATCH/PUT /shadow_sizes/1.json
  def update
    respond_to do |format|
      if @shadow_size.update(shadow_size_params)
        format.html { redirect_to @shadow_size, notice: 'Shadow size was successfully updated.' }
        format.json { render :show, status: :ok, location: @shadow_size }
      else
        format.html { render :edit }
        format.json { render json: @shadow_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shadow_sizes/1
  # DELETE /shadow_sizes/1.json
  def destroy
    @shadow_size.destroy
    respond_to do |format|
      format.html { redirect_to shadow_sizes_url, notice: 'Shadow size was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shadow_size
      @shadow_size = ShadowSize.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shadow_size_params
      params.require(:shadow_size).permit(:fishsize_id)
    end
end
