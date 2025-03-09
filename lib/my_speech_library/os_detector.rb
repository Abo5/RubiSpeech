# frozen_string_literal: true

module MySpeechLibrary
    class OSDetector
      OS_TYPES = {
        windows: /mswin|mingw|cygwin/,
        macos: /darwin/,
        linux: /linux/
      }.freeze
      
      def detect_os
        @detected_os ||= begin
          host_os = RbConfig::CONFIG['host_os']
          
          OS_TYPES.each do |os_type, pattern|
            return os_type if host_os =~ pattern
          end
          
          :unknown
        end
      end
      
      def windows?
        detect_os == :windows
      end
      
      def macos?
        detect_os == :macos
      end
      
      def linux?
        detect_os == :linux
      end
      
      def unknown?
        detect_os == :unknown
      end
    end
  end