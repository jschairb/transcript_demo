require 'spec_helper'

module Application
  describe TranscriptLogger do
    let(:transcript_logger) { TranscriptLogger.new }

    describe ".new" do
      it "sets the logger attribute" do
        expect(transcript_logger.logger).to be_kind_of(Logger)
      end

      context "configures the logger" do
        let(:logger) { transcript_logger.logger }

        it "sets the level to Info" do
          expect(logger.level).to eql(Logger::INFO)
        end
      end
    end
  end
end
