class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[ show edit update destroy ]

  # GET /purchases
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/1
  def show
  end

  # GET /purchases/new
  def new
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
  end

  # POST /purchases
  def create
    @purchase = Purchase.new(purchase_params)

    if @purchase.save
      redirect_to @purchase, notice: "Purchase was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /purchases/1
  def update
    if @purchase.update(purchase_params)
      redirect_to @purchase, notice: "Purchase was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /purchases/1
  def destroy
    @purchase.destroy!
    redirect_to purchases_path, notice: "Purchase was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def purchase_params
      params.expect(purchase: [ :user_id, :coupon_id, :seats ])
    end
end
