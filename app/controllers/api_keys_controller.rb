class ApiKeysController < ApplicationController
  before_action :set_api_key, only: %i[ show update destroy ]

  # GET /api_keys
  # GET /api_keys.json
  def index
    @api_keys = ApiKey.all
  end

  # GET /api_keys/1
  # GET /api_keys/1.json
  def show
  end

  # POST /api_keys
  # POST /api_keys.json
  def create
    @api_key = ApiKey.new(api_key_params)

    if @api_key.save
      render :show, status: :created, location: @api_key
    else
      render json: @api_key.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api_keys/1
  # PATCH/PUT /api_keys/1.json
  def update
    if @api_key.update(api_key_params)
      render :show, status: :ok, location: @api_key
    else
      render json: @api_key.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api_keys/1
  # DELETE /api_keys/1.json
  def destroy
    @api_key.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_key
      @api_key = ApiKey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_key_params
      params.require(:api_key).permit(:public, :secret, :user_id, :master)
    end
end
