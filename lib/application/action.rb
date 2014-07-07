module Application
  class Action
    attr_reader :command, :diagnostic, :transcript

    def initialize(command, diagnostic, transcript = nil)
      @command    = command
      @diagnostic = diagnostic
      @transcript = transcript || Transcript.new
    end

    def execute
      result = run_command
      run_diagnostic unless result.successful?
      true
    end

    def runner
      ShellRunner
    end

    def run_command
      run_runner(command)
    end

    def run_diagnostic
      run_runner(diagnostic)
    end

    private
    def run_runner(cmd)
      transcript.write cmd
      result = runner.run(cmd)
      transcript.write result.output
      result
    end
  end
end
