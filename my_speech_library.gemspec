# frozen_string_literal: true

require_relative "lib/my_speech_library/version"

Gem::Specification.new do |spec|
  spec.name = "RubiSpeech"
  spec.version = MySpeechLibrary::VERSION
  spec.authors = ["Maven"]
  spec.summary = "Ruby text-to-speech library for AI applications"
  spec.description = "A library for text-to-speech functionality designed for AI applications and natural language processing, with the ability to detect and adapt to the operating system (Windows, macOS, Linux)"
  spec.homepage = "https://github.com/Abo5/RubiSpeech"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end