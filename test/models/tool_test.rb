require 'test_helper'

class ToolTest < ActiveSupport::TestCase
  setup do
    @tool = tools(:one)
  end

  test "the truth" do
    assert @tool.respond_to?(:name)
  end
end
