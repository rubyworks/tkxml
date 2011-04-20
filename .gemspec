--- !ruby/object:Gem::Specification 
name: tkxml
version: !ruby/object:Gem::Version 
  hash: 19
  prerelease: false
  segments: 
  - 0
  - 3
  - 0
  version: 0.3.0
platform: ruby
authors: []

autorequire: 
bindir: bin
cert_chain: []

date: 2011-03-05 00:00:00 -05:00
default_executable: 
dependencies: 
- !ruby/object:Gem::Dependency 
  name: syckle
  prerelease: false
  requirement: &id001 !ruby/object:Gem::Requirement 
    none: false
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        hash: 3
        segments: 
        - 0
        version: "0"
  type: :development
  version_requirements: *id001
- !ruby/object:Gem::Dependency 
  name: qed
  prerelease: false
  requirement: &id002 !ruby/object:Gem::Requirement 
    none: false
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        hash: 3
        segments: 
        - 0
        version: "0"
  type: :development
  version_requirements: *id002
description: TkXML translates XML markup into Ruby Tk interface code
email: ""
executables: []

extensions: []

extra_rdoc_files: 
- README.rdoc
files: 
- .ruby
- lib/tkxml/nokogiri.rb
- lib/tkxml/rexml.rb
- lib/tkxml.rb
- lib/tkxml.yml
- test/test_tkxml.rb
- test/ui.xml
- HISTORY.rdoc
- LICENSE
- README.rdoc
- VERSION
has_rdoc: true
homepage: ""
licenses: 
- Apache 2.0
post_install_message: 
rdoc_options: 
- --title
- TkXML API
- --main
- README.rdoc
require_paths: 
- lib
required_ruby_version: !ruby/object:Gem::Requirement 
  none: false
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      hash: 3
      segments: 
      - 0
      version: "0"
required_rubygems_version: !ruby/object:Gem::Requirement 
  none: false
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      hash: 3
      segments: 
      - 0
      version: "0"
requirements: []

rubyforge_project: tkxml
rubygems_version: 1.3.7
signing_key: 
specification_version: 3
summary: XML markup for building Tk User interfaces
test_files: 
- test/test_tkxml.rb
