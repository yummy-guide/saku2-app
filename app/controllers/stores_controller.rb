class StoresController < ApplicationController
  before_action :set_store, only: %i[ show edit update destroy ]

  # GET /stores
  def index
    @stores = Store.all
  end

  # GET /stores/1
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  def create
    @store = Store.new(store_params)

    if @store.save
      redirect_to @store, notice: "Store was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stores/1
  def update
    if params[:store][:remove_image] == '1'
      @store.image.purge
    end

    if params[:store][:remove_thumb] == '1'
      @store.thumb.purge
    end

    if @store.update(store_params)
      attach_images
      redirect_to @store, notice: "Store was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /stores/1
  def destroy
    @store.destroy!
    redirect_to stores_url, notice: "Store was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def store_params
      params.require(:store).permit(:name, :location, :description, :price, :image, :thumb)
    end

    def attach_images
      @store.image.attach(store_params[:image]) if store_params[:image].present?
      @store.thumb.attach(store_params[:thumb]) if store_params[:thumb].present?
    end
end
