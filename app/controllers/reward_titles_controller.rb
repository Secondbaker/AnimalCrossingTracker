class RewardTitlesController < ApplicationController
  before_action :set_reward_title, only: [:show, :edit, :update, :destroy]

  # GET /reward_titles
  # GET /reward_titles.json
  def index
    @reward_titles = RewardTitle.all
  end

  # GET /reward_titles/1
  # GET /reward_titles/1.json
  def show
  end

  # GET /reward_titles/new
  def new
    @reward_title = RewardTitle.new
  end

  # GET /reward_titles/1/edit
  def edit
  end

  # POST /reward_titles
  # POST /reward_titles.json
  def create
    @reward_title = RewardTitle.new(reward_title_params)

    respond_to do |format|
      if @reward_title.save
        format.html { redirect_to @reward_title, notice: 'Reward title was successfully created.' }
        format.json { render :show, status: :created, location: @reward_title }
      else
        format.html { render :new }
        format.json { render json: @reward_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reward_titles/1
  # PATCH/PUT /reward_titles/1.json
  def update
    respond_to do |format|
      if @reward_title.update(reward_title_params)
        format.html { redirect_to @reward_title, notice: 'Reward title was successfully updated.' }
        format.json { render :show, status: :ok, location: @reward_title }
      else
        format.html { render :edit }
        format.json { render json: @reward_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reward_titles/1
  # DELETE /reward_titles/1.json
  def destroy
    @reward_title.destroy
    respond_to do |format|
      format.html { redirect_to reward_titles_url, notice: 'Reward title was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward_title
      @reward_title = RewardTitle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reward_title_params
      params.fetch(:reward_title, {})
    end
end
