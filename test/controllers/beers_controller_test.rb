require 'test_helper'

class BeersControllerTest < ActionController::TestCase
  setup do
    @beer = beers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:beers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create beer" do
    assert_difference('Beer.count') do
      post :create, beer: { abv: @beer.abv, added_by: @beer.added_by, color: @beer.color, description: @beer.description, fg: @beer.fg, instructions: @beer.instructions, name: @beer.name, og: @beer.og }
    end

    assert_redirected_to beer_path(assigns(:beer))
  end

  test "should show beer" do
    get :show, id: @beer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @beer
    assert_response :success
  end

  test "should update beer" do
    patch :update, id: @beer, beer: { abv: @beer.abv, added_by: @beer.added_by, color: @beer.color, description: @beer.description, fg: @beer.fg, instructions: @beer.instructions, name: @beer.name, og: @beer.og }
    assert_redirected_to beer_path(assigns(:beer))
  end

  test "should destroy beer" do
    assert_difference('Beer.count', -1) do
      delete :destroy, id: @beer
    end

    assert_redirected_to beers_path
  end
end
