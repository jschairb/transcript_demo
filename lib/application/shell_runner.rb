require 'open3'

module Application
  class ShellRunner
    attr_reader :command

    def self.run(command)
      runner = new(command)
      runner.run
    end

    def initialize(command)
      @command = command
    end

    def run
      ShellResult.new do |result|
        Open3.popen2e(command) do |_stdin, stdout_err, wait_thr|
          process = wait_thr.value
          Process.wait(process.pid) unless process.exited?

          result.output = stdout_err.read.chomp
          result.status = process
        end
      end
    end
  end
end
