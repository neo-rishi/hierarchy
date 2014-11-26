require 'test_helper'

class HierarchiesControllerTest < ActionController::TestCase
  setup do
    @hierarchy = hierarchies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hierarchies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hierarchy" do
    assert_difference('Hierarchy.count') do
      post :create, hierarchy: { name: @hierarchy.name, parent_id: @hierarchy.parent_id, user_id: @hierarchy.user_id }
    end

    assert_redirected_to hierarchy_path(assigns(:hierarchy))
  end

  test "should show hierarchy" do
    get :show, id: @hierarchy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hierarchy
    assert_response :success
  end

  test "should update hierarchy" do
    patch :update, id: @hierarchy, hierarchy: { name: @hierarchy.name, parent_id: @hierarchy.parent_id, user_id: @hierarchy.user_id }
    assert_redirected_to hierarchy_path(assigns(:hierarchy))
  end

  test "should destroy hierarchy" do
    assert_difference('Hierarchy.count', -1) do
      delete :destroy, id: @hierarchy
    end

    assert_redirected_to hierarchies_path
  end
end
