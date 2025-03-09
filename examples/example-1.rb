# Example 1: Quick Usage (Direct Method)
require 'my_speech_library'

# Use the helper function for immediate speech
MySpeechLibrary.talk("Hello, world!")


# Example 2: Creating and Using an Instance
require 'my_speech_library'

# Create an instance of the main class
speech = MySpeechLibrary::Speech.new

# Use the object to speak text
speech.talk("Hello, I'm speaking using RubiSpeech library")

# Get the current operating system
current_os = speech.current_os
puts "Current operating system: #{current_os}"


# Example 3: Using the Library in a Script (Multiple Phrases)
#!/usr/bin/env ruby
require 'my_speech_library'

# Create a new instance
speaker = MySpeechLibrary::Speech.new

# Phrases to speak
phrases = [
  "Welcome to the Ruby world",
  "This is a text-to-speech library",
  "Works on Windows, Mac, and Linux"
]

# Speak each phrase with a time interval
phrases.each do |phrase|
  speaker.talk(phrase)
  sleep(2) # Wait for 2 seconds between phrases
end


# Example 4: Direct Use of Different Components
require 'my_speech_library'

# Use the OS detector directly
os_detector = MySpeechLibrary::OSDetector.new
puts "Is the system Windows? #{os_detector.windows?}"
puts "Is the system macOS? #{os_detector.macos?}"
puts "Is the system Linux? #{os_detector.linux?}"

# Use the speaker directly
speaker = MySpeechLibrary::Speaker.new(os_detector)
speaker.speak("This is a test using the Speaker class directly")


# Example 5: Using the Library in a Simple Translation Application
require 'my_speech_library'

def translate_and_speak(text, language)
  # This is a hypothetical translation example (in a real app, you'd need a translation service)
  translated = case language
               when :english
                 "This is translated to English: " + text
               when :french
                 "C'est traduit en français: " + text
               else
                 text
               end
  
  # Speak the translated text
  MySpeechLibrary.talk(translated)
end

# Use the function
translate_and_speak("Hello world", :french)