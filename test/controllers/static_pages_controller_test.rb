require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @app_name = "aqua.rb"
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "Home | #{@app_name}"
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | #{@app_name}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@app_name}"
  end

  test "should get About" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@app_name}"
  end
end
