require 'test_helper'

class BeerCommentsControllerTest < ActionController::TestCase
  setup do
    @beer_comment = beer_comments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:beer_comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create beer_comment" do
    assert_difference('BeerComment.count') do
      post :create, beer_comment: { beer_id: @beer_comment.beer_id, like: @beer_comment.like, user_id: @beer_comment.user_id }
    end

    assert_redirected_to beer_comment_path(assigns(:beer_comment))
  end

  test "should show beer_comment" do
    get :show, id: @beer_comment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @beer_comment
    assert_response :success
  end

  test "should update beer_comment" do
    patch :update, id: @beer_comment, beer_comment: { beer_id: @beer_comment.beer_id, like: @beer_comment.like, user_id: @beer_comment.user_id }
    assert_redirected_to beer_comment_path(assigns(:beer_comment))
  end

  test "should destroy beer_comment" do
    assert_difference('BeerComment.count', -1) do
      delete :destroy, id: @beer_comment
    end

    assert_redirected_to beer_comments_path
  end
end
