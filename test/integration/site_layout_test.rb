require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    # Logo-image and Home-text in Header
    assert_select "a[href=?]", root_path, count: 2
    # Help-text in Header
    assert_select "a[href=?]", help_path
    # About-text in Footer
    assert_select "a[href=?]", about_path
    # Contact-text in Footer
    assert_select "a[href=?]", contact_path
    # SignUp button in Home
    assert_select "a[href=?]", signup_path
  end

  test "title text" do
    get contact_path
    assert_select "title", full_title("Contact")
  end
end
