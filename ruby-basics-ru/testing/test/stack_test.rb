# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'


class StackTest < Minitest::Test
  def setup
    @stack = Stack.new
  end

  def test_add_element
    new_element = 'element'
    @stack.push!(new_element)
    assert_equal(1, @stack.size)
  end

  def test_delete_element
    new_element = 'element'
    @stack.push!(new_element)
    @stack.pop!
    assert(@stack.empty?)
  end

  def test_clear_stack
    new_element = 'element'
    @stack.push!(new_element)
    @stack.clear!
    assert(@stack.empty?)
  end

  def test_stack_empty
    assert(@stack.empty?)
  end
end
test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
