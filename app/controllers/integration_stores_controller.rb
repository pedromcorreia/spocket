class IntegrationStoresController < ApplicationController
  before_action :set_integration_store, only: %i[ show destroy sync]

  # GET /integration_stores or /integration_stores.json
  def index
    @integration_stores = IntegrationStore.all
  end

  # GET /integration_stores/1 or /integration_stores/1.json
  def show
  end

  # GET /integration_stores/new
  def new
    @integration_store = IntegrationStore.new
  end

  def sync
    ::Integrations::Integrations.new(current_user.id, @integration_store.kind).call
  end

  # POST /integration_stores or /integration_stores.json
  def create
    @integration_store = IntegrationStore.new(integration_store_params.merge(supplier: current_user))

    respond_to do |format|
      if @integration_store.save
        format.html { redirect_to @integration_store, notice: "Integration store was successfully created." }
        format.json { render :show, status: :created, location: @integration_store }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @integration_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /integration_stores/1 or /integration_stores/1.json
  def destroy
    @integration_store.destroy
    respond_to do |format|
      format.html { redirect_to integration_stores_url, notice: "Integration store was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_integration_store
      @integration_store = IntegrationStore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def integration_store_params
      params.require(:integration_store).permit(:kind, :store_name, :api_key, :password, :user_id)
    end
end
