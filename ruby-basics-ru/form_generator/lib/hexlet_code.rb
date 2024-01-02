# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  # Your code goes here...
  autoload :Tag, "hexlet_code/tag.rb"

  puts "start"
end
