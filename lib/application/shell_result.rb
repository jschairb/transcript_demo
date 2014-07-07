module Application
  class ShellResult
    attr_reader :output, :status

    class ::ImmutableAttributeError < StandardError; end

    def initialize
      yield self if block_given?
    end

    def exitstatus
      status.exitstatus
    end

    def output=(output)
      unless @output.nil?
        raise ImmutableAttributeError, "output is an immutable attribute"
      end
      @output = output
    end

    def status=(status)
      unless @status.nil?
        raise ImmutableAttributeError, "status is an immutable attribute"
      end
      @status = status
    end

    def successful?
      return false if status.nil?
      status.success?
    end
  end
end
