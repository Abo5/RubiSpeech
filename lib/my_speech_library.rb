# frozen_string_literal: true

require_relative "my_speech_library/version"
require_relative "my_speech_library/os_detector"
require_relative "my_speech_library/speaker"

module MySpeechLibrary
  class Error < StandardError; end
  
  class Speech
    def initialize
      @os_detector = OSDetector.new
      @speaker = Speaker.new(@os_detector)
    end
    
    def talk(text)
      @speaker.speak(text)
    end
    
    def current_os
      @os_detector.detect_os
    end
  end
  
  def self.talk(text)
    Speech.new.talk(text)
  end
end