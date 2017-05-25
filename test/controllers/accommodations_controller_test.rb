require 'test_helper'

class AccommodationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @accommodation = accommodations(:one)
  end

  test "should get index" do
    get accommodations_url
    assert_response :success
  end

  test "should get new" do
    get new_accommodation_url
    assert_response :success
  end

  test "should create accommodation" do
    assert_difference('Accommodation.count') do
      post accommodations_url, params: { accommodation: { capacity: @accommodation.capacity, number: @accommodation.number, price: @accommodation.price } }
    end

    assert_redirected_to accommodation_url(Accommodation.last)
  end

  test "should show accommodation" do
    get accommodation_url(@accommodation)
    assert_response :success
  end

  test "should get edit" do
    get edit_accommodation_url(@accommodation)
    assert_response :success
  end

  test "should update accommodation" do
    patch accommodation_url(@accommodation), params: { accommodation: { capacity: @accommodation.capacity, number: @accommodation.number, price: @accommodation.price } }
    assert_redirected_to accommodation_url(@accommodation)
  end

  test "should destroy accommodation" do
    assert_difference('Accommodation.count', -1) do
      delete accommodation_url(@accommodation)
    end

    assert_redirected_to accommodations_url
  end
end
