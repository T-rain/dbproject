require 'test_helper'

class LoyalsControllerTest < ActionController::TestCase
  setup do
    @loyal = loyals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loyals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loyal" do
    assert_difference('Loyal.count') do
      post :create, loyal: { age: @loyal.age, gender: @loyal.gender, region: @loyal.region, year: @loyal.year }
    end

    assert_redirected_to loyal_path(assigns(:loyal))
  end

  test "should show loyal" do
    get :show, id: @loyal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loyal
    assert_response :success
  end

  test "should update loyal" do
    patch :update, id: @loyal, loyal: { age: @loyal.age, gender: @loyal.gender, region: @loyal.region, year: @loyal.year }
    assert_redirected_to loyal_path(assigns(:loyal))
  end

  test "should destroy loyal" do
    assert_difference('Loyal.count', -1) do
      delete :destroy, id: @loyal
    end

    assert_redirected_to loyals_path
  end
end
