require 'test_helper'

class MyAdminTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, MyAdmin
  end
  
  test "addition" do
    MyAdmin::Test::TestClass.new.add()
  end
end
