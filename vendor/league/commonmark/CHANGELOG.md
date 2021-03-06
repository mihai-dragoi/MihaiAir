# Change Log
All notable changes to this project will be documented in this file.
Updates should follow the [Keep a CHANGELOG](http://keepachangelog.com/) principles.

## [Unreleased][unreleased]

## [0.6.1] - 2015-01-25
### Changed
 - Bumped spec target version to 0.17
 - Updated emphasis parsing for underscores to prevent intra-word emphasis
 - Defered closing of fenced code blocks

## [0.6.0] - 2015-01-09
### Added
 - Bulk registration of parsers/renderers via extensions (#45)
 - Proper UTF-8 support, especially in the Cursor; mbstring extension is now required (#49)
 - Environment is now configurable; options can be accessed in its parsers/renderers (#56)
 - Added some unit tests 

### Changed
 - Bumped spec target version to 0.15 (#50)
 - Parsers/renderers are now lazy-initialized (#52)
 - Some private elements are now protected for easier extending, especially on Element classes (#53)
 - Renderer option keys changed from camelCase to underscore_case (#56) 
 - Moved CommonMark parser/render definitions into CommonMarkCoreExtension

### Fixed
 - Improved parsing of emphasis around punctuation
 - Improved regexes for CDATA and HTML comments
 - Fixed issue with HTML content that is considered false in loose comparisons, like `'0'` (#55)
 - Fixed DocParser trying to add empty strings to closed containers (#58)
 - Fixed incorrect use of a null parameter value in the HtmlElementTest

### Removed
 - Removed unused ReferenceDefinition* classes (#51)
 - Removed UnicodeCaseFolder in favor of mb_strtoupper

## [0.5.1] - 2014-12-27
### Fixed
 - Fixed infinite loop and link-in-link-in-image parsing (#37)

### Removed
 - Removed hard dependency on mbstring extension; workaround used if not installed (#38)

## [0.5.0] - 2014-12-24
### Added
 - Support for custom directives, parsers, and renderers

### Changed
 - Major refactoring to de-couple directives from the parser, support custom directive functionality, and reduce complexity
 - Updated references to stmd.js in README and docblocks
 - Modified CHANGELOG formatting
 - Improved travis configuration
 - Put tests in autoload-dev

### Fixed
 - Fixed CommonMarkConverter re-creating object each time new text is converted (#26)

### Removed
 - Removed HtmlRenderer::render() (use the renderBlock method instead)
 - Removed dependency on symfony/options-resolver (fixes #20)

## [0.4.0] - 2014-12-15
### Added
 - Added some missing copyright info

### Changed
 - Changed namespace to League\CommonMark
 - Made compatible with spec version 0.13
 - Moved delimiter stack functionality into separate class

### Fixed
 - Fixed regex which caused HHVM tests to fail

## [0.3.0] - 2014-11-28
### Added
 - Made renderer options configurable (issue #7)

### Changed
 - Made compatible with spec version 0.12
 - Stack-based parsing now used for emphasis, links and images
 - Protected some of the internal renderer methods which shouldn't have been `public`
 - Minor code clean-up (including PSR-2 compliance)

### Removed
 - Removed unnecessary distinction between ATX and Setext headers

## [0.2.1] - 2014-11-09
### Added
 - Added simpler string replacement to a method

### Changed
 - Removed "is" prefix from boolean methods
 * Updated to latest version of PHPUnit
 * Target specific spec version

## [0.2.0] - 2014-11-09
### Changed
 - Mirrored significant changes and improvements from stmd.js
 - Made compatible with spec version 0.10
 - Updated location of JGM's repository
 - Allowed HHVM tests to fail without affecting overall build success

### Removed
 - Removed composer.lock
 - Removed fixed reference to jgm/stmd@0275f34

## [0.1.2] - 2014-09-28
### Added
 - Added performance benchmarking tool (issue #2)
 - Added more badges to the README

### Changed
 - Fix JS -> PHP null judgement (issue #4)
 - Updated phpunit dependency

## [0.1.1] - 2014-09-08
### Added
 - Add anchors to regexes

### Changed
 - Updated target spec (now compatible with jgm/stmd:spec.txt @ 2cf0750)
 - Adjust HTML output for fenced code
 - Adjust block-level tag regex (remove "br", add "iframe")
 - Fix incorrect handling of nested emphasis

## 0.1.0
### Added
 - Initial commit (compatible with jgm/stmd:spec.txt @ 0275f34)

[unreleased]: https://github.com/thephpleague/commonmark/compare/0.6.1...HEAD
[0.6.1]: https://github.com/thephpleague/commonmark/compare/0.6.0...0.6.1
[0.6.0]: https://github.com/thephpleague/commonmark/compare/0.5.1...0.6.0
[0.5.1]: https://github.com/thephpleague/commonmark/compare/0.5.0...0.5.1
[0.5.0]: https://github.com/thephpleague/commonmark/compare/0.4.0...0.5.0
[0.4.0]: https://github.com/thephpleague/commonmark/compare/0.3.0...0.4.0
[0.3.0]: https://github.com/thephpleague/commonmark/compare/0.2.1...0.3.0
[0.2.1]: https://github.com/thephpleague/commonmark/compare/0.2.0...0.2.1
[0.2.0]: https://github.com/thephpleague/commonmark/compare/0.1.2...0.2.0
[0.1.2]: https://github.com/thephpleague/commonmark/compare/0.1.1...0.1.2
[0.1.1]: https://github.com/thephpleague/commonmark/compare/0.1.0...0.1.1
