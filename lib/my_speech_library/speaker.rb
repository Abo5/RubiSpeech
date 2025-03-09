# frozen_string_literal: true

module MySpeechLibrary
    class Speaker
      def initialize(os_detector)
        @os_detector = os_detector
      end
      
      def speak(text)
        command = speech_command(text)
        
        if command.nil?
          error_message = "The operating system #{@os_detector.detect_os} is not supported for voice pronunciation"
          warn error_message
          raise UnsupportedOSError, error_message
        end
        
        result = system(command)
        
        result
      end
      
      private
      
      def speech_command(text)
        case @os_detector.detect_os
        when :windows
          escaped_text = text.gsub("'", "''")
          %{powershell -Command "Add-Type -AssemblyName System.Speech; (New-Object System.Speech.Synthesis.SpeechSynthesizer).Speak('#{escaped_text}')"}
        when :macos
          escaped_text = text.gsub("'", "'\\''")
          "say '#{escaped_text}'"
        when :linux
          escaped_text = text.gsub("'", "'\\''")
          "espeak '#{escaped_text}'"
        else
          nil
        end
      end
    end
  end