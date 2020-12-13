require 'minitest/autorun'
require './sum'
 
class TestSum < Minitest::Test
    def test_sum
        assert_equal( sum( 1, 2 ), 3 )
    end
end