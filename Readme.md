# RubiSpeech

A lightweight, cross-platform Ruby gem for text-to-speech functionality. RubiSpeech is designed for AI applications and natural language processing systems, with the ability to detect and adapt to different operating systems (Windows, macOS, Linux).

[![Gem Version](https://badge.fury.io/rb/RubiSpeech.svg)](https://badge.fury.io/rb/RubiSpeech)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## Features

- Cross-platform text-to-speech capabilities
- Automatic operating system detection
- Easy-to-use API
- Supports Windows, macOS, and Linux
- Designed for AI and NLP applications

## Requirements

- Ruby >= 2.6.0
- Windows: No additional requirements (uses System.Speech via PowerShell)
- macOS: No additional requirements (uses built-in `say` command)
- Linux: `espeak` package installed

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'RubiSpeech'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install RubiSpeech
```

## Usage

### Quick Start

```ruby
require 'my_speech_library'

# Simple usage - speak text immediately
MySpeechLibrary.talk("Hello, world!")
```

### Creating an Instance

```ruby
require 'my_speech_library'

# Create a speech instance
speech = MySpeechLibrary::Speech.new

# Speak some text
speech.talk("Hello, I'm speaking using RubiSpeech library")

# Check the current operating system
current_os = speech.current_os
puts "Current operating system: #{current_os}"
```

### Multiple Phrases with Interval

```ruby
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
```

### Direct Use of Components

```ruby
require 'my_speech_library'

# Use the OS detector directly
os_detector = MySpeechLibrary::OSDetector.new
puts "Is the system Windows? #{os_detector.windows?}"
puts "Is the system macOS? #{os_detector.macos?}"
puts "Is the system Linux? #{os_detector.linux?}"

# Use the speaker directly
speaker = MySpeechLibrary::Speaker.new(os_detector)
speaker.speak("This is a test using the Speaker class directly")
```

### Simple Translation Application Example

```ruby
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
```

## How It Works

RubiSpeech uses system commands to provide text-to-speech functionality:

- On Windows: PowerShell with System.Speech
- On macOS: The built-in `say` command
- On Linux: The `espeak` command (must be installed)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


# RubiSpeech
