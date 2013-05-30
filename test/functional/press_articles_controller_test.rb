require 'test_helper'

class PressArticlesControllerTest < ActionController::TestCase
  setup do
    @press_article = press_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:press_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create press_article" do
    assert_difference('PressArticle.count') do
      post :create, press_article: {  }
    end

    assert_redirected_to press_article_path(assigns(:press_article))
  end

  test "should show press_article" do
    get :show, id: @press_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @press_article
    assert_response :success
  end

  test "should update press_article" do
    put :update, id: @press_article, press_article: {  }
    assert_redirected_to press_article_path(assigns(:press_article))
  end

  test "should destroy press_article" do
    assert_difference('PressArticle.count', -1) do
      delete :destroy, id: @press_article
    end

    assert_redirected_to press_articles_path
  end
end
