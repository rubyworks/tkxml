--- 
name: tkxml
organizaton: RubyWorks
title: TkXML
contact: trans <transfire+tkxml AT gmail.com>
requires: 
- group: 
  - build
  name: syckle
  version: 0+
- group: 
  - test
  name: qed
  version: 0+
pom_verison: 1.0.0
manifest: 
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
version: 0.2.4
copyright: (c) 2008 Trans
licenses: 
- Apache 2.0
description: TkXML translates XML markup into Ruby Tk interface code
summary: XML markup for building Tk User interfaces
created: 2008-02-21
