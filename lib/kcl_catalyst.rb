# frozen_string_literal: true

require "kcl_catalyst/version"

module KclCatalyst
  class Error < StandardError; end

  JAR_DOWNLOAD_DIR = File.realpath(File.join __FILE__, '..', 'jars')
  JAR_FILES = Dir.glob("#{JAR_DOWNLOAD_DIR}/*.jar")

  autoload :Downloader, 'kcl_catalyst/downloader'
  autoload :Runner, 'kcl_catalyst/runner'
end
