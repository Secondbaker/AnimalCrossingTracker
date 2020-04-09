class RewardTitlePositionsController < ApplicationController
  before_action :set_reward_title_position, only: [:show, :edit, :update, :destroy]

  # GET /reward_title_positions
  # GET /reward_title_positions.json
  def index
    @reward_title_positions = RewardTitlePosition.all
  end

  # GET /reward_title_positions/1
  # GET /reward_title_positions/1.json
  def show
  end

  # GET /reward_title_positions/new
  def new
    @reward_title_position = RewardTitlePosition.new
  end

  # GET /reward_title_positions/1/edit
  def edit
  end

  # POST /reward_title_positions
  # POST /reward_title_positions.json
  def create
    @reward_title_position = RewardTitlePosition.new(reward_title_position_params)

    respond_to do |format|
      if @reward_title_position.save
        format.html { redirect_to @reward_title_position, notice: 'Reward title position was successfully created.' }
        format.json { render :show, status: :created, location: @reward_title_position }
      else
        format.html { render :new }
        format.json { render json: @reward_title_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reward_title_positions/1
  # PATCH/PUT /reward_title_positions/1.json
  def update
    respond_to do |format|
      if @reward_title_position.update(reward_title_position_params)
        format.html { redirect_to @reward_title_position, notice: 'Reward title position was successfully updated.' }
        format.json { render :show, status: :ok, location: @reward_title_position }
      else
        format.html { render :edit }
        format.json { render json: @reward_title_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reward_title_positions/1
  # DELETE /reward_title_positions/1.json
  def destroy
    @reward_title_position.destroy
    respond_to do |format|
      format.html { redirect_to reward_title_positions_url, notice: 'Reward title position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward_title_position
      @reward_title_position = RewardTitlePosition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reward_title_position_params
      params.fetch(:reward_title_position, {})
    end
end
