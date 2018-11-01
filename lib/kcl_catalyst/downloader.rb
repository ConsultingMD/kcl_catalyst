require 'open-uri'

module KclCatalyst
  class Downloader
    MAVEN_LIST = {
      'com.amazonaws' => [
        ['amazon-kinesis-client', '1.7.6'],
        ['aws-java-sdk-dynamodb', '1.11.151'],
        ['aws-java-sdk-s3', '1.11.151'],
        ['aws-java-sdk-kms', '1.11.151'],
        ['aws-java-sdk-core', '1.11.151'],
        ['aws-java-sdk-kinesis', '1.11.151'],
        ['aws-java-sdk-cloudwatch', '1.11.151']
      ],
      'com.fasterxml.jackson.core' => [
        ['jackson-databind', '2.6.6'],
        ['jackson-annotations', '2.6.0'],
        ['jackson-core', '2.6.6'],
      ],
      'com.fasterxml.jackson.dataformat' => [['jackson-dataformat-cbor', '2.6.6']],
      'com.google.guava' => [['guava', '18.0']],
      'com.google.protobuf' => [['protobuf-java', '2.6.1']],
      'commons-codec' => [['commons-codec', '1.9']],
      'commons-lang' => [['commons-lang', '2.6']],
      'commons-logging' => [['commons-logging', '1.1.3']],
      'joda-time' => [['joda-time', '2.8.1']],
      'org.apache.httpcomponents' => [
        ['httpclient', '4.5.2'],
        ['httpcore', '4.4.4'],
      ]
    }

    def maven_list
      MAVEN_LIST
    end

    def jar_download_dir
      @jar_download_dir ||= File.realpath(File.join __FILE__, '..', '..', 'jars')
    end

    def go
      maven_list.each do |group_id, artifacts|
        artifacts.each do |artifact|
          get maven_url_for(group_id, artifact), file_name: "#{artifact[0]}-#{artifact[1]}.jar"
        end
      end
      self
    end

    def get url, file_name:
      File.open("#{jar_download_dir}/#{file_name}", "wb+") do |jar_file|
        open(url, "rb") do |remote_data|
          jar_file.write remote_data.read
        end
      end
      self
    end

    def maven_url_for group_id, artifact
      jar_name = artifact[0]
      version = artifact[1]
      "https://repo1.maven.org/maven2/#{group_id.tr('.', '/')}/#{jar_name}/#{version}/#{jar_name}-#{version}.jar"
    end
  end
end
