require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
    test "full title helper" do
        assert_equal 'aqua.rb', full_title
        assert_equal 'Love | aqua.rb', full_title('Love')
    end
end