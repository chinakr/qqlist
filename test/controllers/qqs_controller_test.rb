require 'test_helper'

class QqsControllerTest < ActionController::TestCase
  setup do
    @qq = qqs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qqs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qq" do
    assert_difference('Qq.count') do
      post :create, qq: { list_id: @qq.list_id, number: '12341234', status: @qq.status }
      #post :create, qq: { list_id: @qq.list_id, number: @qq.number, status: @qq.status }
    end

    assert_redirected_to qq_path(assigns(:qq))
  end

  test "should show qq" do
    get :show, id: @qq
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qq
    assert_response :success
  end

  test "should update qq" do
    patch :update, id: @qq, qq: { list_id: @qq.list_id, number: @qq.number, status: @qq.status }
    assert_redirected_to qq_path(assigns(:qq))
  end

  test "should destroy qq" do
    assert_difference('Qq.count', -1) do
      delete :destroy, id: @qq
    end

    assert_redirected_to qqs_path
  end
end
