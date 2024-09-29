require "application_system_test_case"

class CouponsTest < ApplicationSystemTestCase
  setup do
    @coupon = coupons(:one)
  end

  test "visiting the index" do
    visit coupons_url
    assert_selector "h1", text: "Coupons"
  end

  test "should create coupon" do
    visit coupons_url
    click_on "New coupon"

    check "Active" if @coupon.active
    fill_in "Amount", with: @coupon.amount
    fill_in "Store", with: @coupon.store_id
    click_on "Create Coupon"

    assert_text "Coupon was successfully created"
    click_on "Back"
  end

  test "should update Coupon" do
    visit coupon_url(@coupon)
    click_on "Edit this coupon", match: :first

    check "Active" if @coupon.active
    fill_in "Amount", with: @coupon.amount
    fill_in "Store", with: @coupon.store_id
    click_on "Update Coupon"

    assert_text "Coupon was successfully updated"
    click_on "Back"
  end

  test "should destroy Coupon" do
    visit coupon_url(@coupon)
    click_on "Destroy this coupon", match: :first

    assert_text "Coupon was successfully destroyed"
  end
end
