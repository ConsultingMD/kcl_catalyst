# frozen_string_literal: true

require 'test_helper'
require 'pry'

class RunnerTest < Minitest::Test
  def sample_properties_file_location
    File.realdirpath(File.join(File.dirname(__FILE__), 'fixtures', 'test.properties'))
  end

  def setup
    @runner = KclCatalyst::Runner.new properties_file: sample_properties_file_location
  end
  attr_accessor :runner

  def test_constructs_run_command
    #what do we test for here?
    runner.run_command
  end
end
