require 'test_helper'

class OutletsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outlets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outlet" do
    assert_difference('Outlet.count') do
      post :create, :outlet => { }
    end

    assert_redirected_to outlet_path(assigns(:outlet))
  end

  test "should show outlet" do
    get :show, :id => outlets(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => outlets(:one).to_param
    assert_response :success
  end

  test "should update outlet" do
    put :update, :id => outlets(:one).to_param, :outlet => { }
    assert_redirected_to outlet_path(assigns(:outlet))
  end

  test "should destroy outlet" do
    assert_difference('Outlet.count', -1) do
      delete :destroy, :id => outlets(:one).to_param
    end

    assert_redirected_to outlets_path
  end
end
