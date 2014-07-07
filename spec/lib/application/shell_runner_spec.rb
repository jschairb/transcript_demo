require 'spec_helper'

module Application
  describe ShellRunner do
    let(:command) { "echo 'It Works!'" }
    let(:runner)  { ShellRunner.new(command) }

    describe ".new" do
      it "sets the command attribute" do
        expect(runner.command).to eql(command)
      end
    end

    describe "#run" do
      let(:result) { runner.run }

      it "returns a ShellResult" do
        expect(result).to be_kind_of(ShellResult)
      end

      it "sets the result output" do
        expect(result.output).to eql("It Works!")
      end

      it "includes the exitstatus" do
        expect(result.exitstatus).to eql(0)
      end
    end
  end
end
