# frozen_string_literal: true

module KclCatalyst
  class Runner
    attr_accessor :properties_file

    def self.call(**args)
      new.call(args)
    end

    def initialize properties_file:
      self.properties_file = properties_file
    end

    def call
      Kernel.exec run_command
    end

    attr_reader :properties_file

    def run_command
      "java -classpath #{KclCatalyst::JAR_FILES.join(':')} "\
      "com.amazonaws.services.kinesis.multilang.MultiLangDaemon #{properties_file}"
    end
  end
end
