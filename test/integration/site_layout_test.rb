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
  end
end
