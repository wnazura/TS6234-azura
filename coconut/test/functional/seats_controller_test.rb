require 'test_helper'

class SeatsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seat" do
    assert_difference('Seat.count') do
      post :create, :seat => { }
    end

    assert_redirected_to seat_path(assigns(:seat))
  end

  test "should show seat" do
    get :show, :id => seats(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => seats(:one).to_param
    assert_response :success
  end

  test "should update seat" do
    put :update, :id => seats(:one).to_param, :seat => { }
    assert_redirected_to seat_path(assigns(:seat))
  end

  test "should destroy seat" do
    assert_difference('Seat.count', -1) do
      delete :destroy, :id => seats(:one).to_param
    end

    assert_redirected_to seats_path
  end
end
