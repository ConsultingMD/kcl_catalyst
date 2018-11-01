require "kcl_catalyst/version"

module KclCatalyst
  class Error < StandardError; end

  autoload :Downloader, 'kcl_catalyst/downloader'
end
