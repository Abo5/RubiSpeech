# frozen_string_literal: true

RSpec.describe MySpeechLibrary do
    it "has a version number" do
      expect(MySpeechLibrary::VERSION).not_to be nil
    end
  
    describe MySpeechLibrary::OSDetector do
      let(:detector) { MySpeechLibrary::OSDetector.new }
  
      it "detects the current operating system" do
        os = detector.detect_os
        expect([:windows, :macos, :linux, :unknown]).to include(os)
      end
    end
  
    describe MySpeechLibrary::Speaker do
      let(:detector) { MySpeechLibrary::OSDetector.new }
      let(:speaker) { MySpeechLibrary::Speaker.new(detector) }
  
      context "when generating speech commands" do
        it "generates different commands for different OS types" do
          allow(detector).to receive(:detect_os).and_return(:windows)
          windows_command = speaker.send(:speech_command, "test")
          expect(windows_command).to include("powershell")
  
          allow(detector).to receive(:detect_os).and_return(:macos)
          macos_command = speaker.send(:speech_command, "test")
          expect(macos_command).to include("say")
  
          allow(detector).to receive(:detect_os).and_return(:linux)
          linux_command = speaker.send(:speech_command, "test")
          expect(linux_command).to include("espeak")
        end
      end
    end
  
    describe ".talk" do
      it "is available as a module method" do
        expect(MySpeechLibrary).to respond_to(:talk)
      end
    end
  end