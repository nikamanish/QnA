require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@group = Group.new(name: "Walchand")
  end

  test "name should be unique" do
  	dup_group = @group.dup
  	@group.save
  	assert_not dup_group.valid?
  end

  test "name should be of minimum length 6" do
  	@group.name = "a"*5
  	@group.save
  	assert_not @group.valid?
  end

  test "name should not be blank" do
  	@group.name = "       "
  	@group.save
  	assert_not @group.valid?
  end
end
