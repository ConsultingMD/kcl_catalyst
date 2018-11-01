$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "kcl_catalyst"
require 'minitest/reporters'
Minitest::Reporters.use!
require "minitest/autorun"
