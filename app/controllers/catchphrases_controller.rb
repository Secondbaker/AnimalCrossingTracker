class CatchphrasesController < ApplicationController
  before_action :set_catchphrase, only: [:show, :edit, :update, :destroy]

  # GET /catchphrases
  # GET /catchphrases.json
  def index
    @catchphrases = Catchphrase.all
  end

  # GET /catchphrases/1
  # GET /catchphrases/1.json
  def show
  end

  # GET /catchphrases/new
  def new
    @catchphrase = Catchphrase.new
  end

  # GET /catchphrases/1/edit
  def edit
  end

  # POST /catchphrases
  # POST /catchphrases.json
  def create
    @catchphrase = Catchphrase.new(catchphrase_params)

    respond_to do |format|
      if @catchphrase.save
        format.html { redirect_to @catchphrase, notice: 'Catchphrase was successfully created.' }
        format.json { render :show, status: :created, location: @catchphrase }
      else
        format.html { render :new }
        format.json { render json: @catchphrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catchphrases/1
  # PATCH/PUT /catchphrases/1.json
  def update
    respond_to do |format|
      if @catchphrase.update(catchphrase_params)
        format.html { redirect_to @catchphrase, notice: 'Catchphrase was successfully updated.' }
        format.json { render :show, status: :ok, location: @catchphrase }
      else
        format.html { render :edit }
        format.json { render json: @catchphrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catchphrases/1
  # DELETE /catchphrases/1.json
  def destroy
    @catchphrase.destroy
    respond_to do |format|
      format.html { redirect_to catchphrases_url, notice: 'Catchphrase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catchphrase
      @catchphrase = Catchphrase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def catchphrase_params
      params.require(:catchphrase).permit(:name)
    end
end
