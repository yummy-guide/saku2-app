class CouponsController < ApplicationController
  before_action :set_store

  # GET /coupons
  def index
    @coupons = @store.coupons
  end

  # GET /coupons/1
  def show
  end

  # GET /coupons/new
  def new
    @coupon = @store.coupons.build
  end

  # GET /coupons/1/edit
  def edit
  end

  # POST /coupons
  def create
    @coupon = @store.coupons.build(coupon_params)
    if @coupon.save
      redirect_to store_coupons_path(@store), notice: 'Coupon was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /coupons/1
  def update
    if @coupon.update(coupon_params)
      redirect_to @coupon, notice: "Coupon was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /coupons/1
  def destroy
    @coupon.destroy!
    redirect_to coupons_url, notice: "Coupon was successfully destroyed.", status: :see_other
  end

  private

  def set_store
    @store = Store.find(params[:store_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_coupon
    @coupon = Coupon.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def coupon_params
    params.require(:coupon).permit(:store_id, :seats, :active)
  end
end
