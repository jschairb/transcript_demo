module Application
  class Transcript
    attr_reader :buffer, :logger

    def initialize(buffer = nil)
      @buffer = buffer
      @logger = TranscriptLogger.new(buffer)
    end

    def to_s
      logger.to_s
    end

    def write(message)
      logger.info message
    end
  end
end
