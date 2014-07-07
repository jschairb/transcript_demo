require 'spec_helper'

module Application
  describe ShellResult do
    let(:output) { "output" }
    let(:result) { ShellResult.new }
    let(:status) { double(:status, exitstatus: 0, success?: true) }

    describe ".new" do
      it "can take a block for initialization" do
        result = ShellResult.new do |result|
          result.output = output
        end

        expect(result.output).to eql(output)
      end
    end

    describe "#exitstatus" do
      before do
        result.status = status
      end

      it "returns the process exit status" do
        expect(result.exitstatus).to eql(0)
      end
    end

    describe "#output=" do
      it "sets the output attribute" do
        result.output = output
        expect(result.output).to eql(output)
      end

      context "when output is already set" do
        before do
          result.output = output
        end

        it "raise an ImmutableAttributeError" do
          expect { result.output = "new output" }.
            to raise_exception(ImmutableAttributeError)
        end
      end
    end

    describe "#status=" do
      it "sets the status attribute" do
        result.status = status
        expect(result.status).to eql(status)
      end

      context "when status is already set" do
        before do
          result.status = status
        end

        it "raise an ImmutableAttributeError" do
          expect { result.status = "new status" }.
            to raise_exception(ImmutableAttributeError)
        end
      end
    end

    describe "#successful?" do

      it "returns true" do
        result.status = status
        expect(result).to be_successful
      end

      context "when status is nil" do
        it "returns false" do
          expect(result.status).to be_nil
          expect(result).to_not be_successful
        end
      end
    end
  end
end
