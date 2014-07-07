require 'logger'
require 'stringio'

module Application
  class TranscriptLogger

    class TranscriptFormatter
      def self.call(severity, time, progname, msg)
        "#{time.strftime("%H:%M:%S")} - #{msg}\n"
      end
    end

    extend Forwardable
    def_delegators :logger, *Logger.public_instance_methods(false)

    attr_reader :logger, :logdev

    def initialize(logdev = nil)
      @logdev           = logdev || StringIO.new
      @logger           = Logger.new(@logdev)
      @logger.level     = Logger::INFO
      @logger.formatter = TranscriptFormatter
    end

    def to_s
      logdev.string
    end
  end
end
