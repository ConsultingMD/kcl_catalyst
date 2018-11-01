require 'test_helper'

class JarDownloaderTest < Minitest::Test
  def setup
    @downloader = KclCatalyst::Downloader.new
  end

  attr_accessor :downloader

  def test_has_a_maven_list
    refute downloader.maven_list.empty?
  end

  def test_has_a_download_directory
    refute downloader.jar_download_dir.empty?
  end

  def test_constructs_a_proper_url
    url = downloader.maven_url_for('com.amazonaws', ['amazon-kinesis-client', '1.7.6'])
    puts url
    assert_equal(
      'https://repo1.maven.org/maven2/com/amazonaws/'\
      'amazon-kinesis-client/1.7.6/amazon-kinesis-client-1.7.6.jar',
      url
    )
  end
end
