require 'test_helper'

class HotelinformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotelinformation = hotelinformations(:one)
  end

  test "should get index" do
    get hotelinformations_url
    assert_response :success
  end

  test "should get new" do
    get new_hotelinformation_url
    assert_response :success
  end

  test "should create hotelinformation" do
    assert_difference('Hotelinformation.count') do
      post hotelinformations_url, params: { hotelinformation: { address: @hotelinformation.address, description: @hotelinformation.description, email: @hotelinformation.email, fone: @hotelinformation.fone } }
    end

    assert_redirected_to hotelinformation_url(Hotelinformation.last)
  end

  test "should show hotelinformation" do
    get hotelinformation_url(@hotelinformation)
    assert_response :success
  end

  test "should get edit" do
    get edit_hotelinformation_url(@hotelinformation)
    assert_response :success
  end

  test "should update hotelinformation" do
    patch hotelinformation_url(@hotelinformation), params: { hotelinformation: { address: @hotelinformation.address, description: @hotelinformation.description, email: @hotelinformation.email, fone: @hotelinformation.fone } }
    assert_redirected_to hotelinformation_url(@hotelinformation)
  end

  test "should destroy hotelinformation" do
    assert_difference('Hotelinformation.count', -1) do
      delete hotelinformation_url(@hotelinformation)
    end

    assert_redirected_to hotelinformations_url
  end
end
