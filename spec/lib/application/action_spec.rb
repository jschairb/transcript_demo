require 'spec_helper'

module Application
  describe Action do
    let(:action)     { Action.new(command, diagnostic) }
    let(:command)    { "/sbin/ping -c 1 #{host}" }
    let(:diagnostic) { "/usr/sbin/traceroute #{host}" }
    let(:host)       { 'google.com' }
    let(:result)     { double(:result, output: 'output', successful?: true) }


    describe ".new" do
      it "sets the command attribute" do
        expect(action.command).to eql(command)
      end

      it "sets the diagnostic" do
        expect(action.diagnostic).to eql(diagnostic)
      end

      it "sets the transcript, be default" do
        expect(action.transcript).to_not be_nil
      end
    end

    describe "#execute" do
      it "executes the command" do
        expect(action).
          to(receive(:run_command).and_return(result))
        action.execute
      end

      context "when the command fails" do
        it "runs the diagnostic" do
        end
      end
    end

    describe "#runner" do
      it "uses a ShellRunner" do
        expect(action.runner).to eql(ShellRunner)
      end
    end

    describe "#run_command" do
      let(:runner) { action.runner }

      it "runs the command" do
        expect(runner).to receive(:run).with(command).and_return(result)
        action.run_command
      end

      it "writes the command to the transcript" do
        action.run_command
        expect(action.transcript.to_s).to include(command)
      end
    end

    describe "#run_diagnostic" do
      let(:runner) { action.runner }

      it "runs the diagnostic" do
        expect(runner).to receive(:run).with(diagnostic).and_return(result)
        action.run_diagnostic
      end
    end
  end
end
