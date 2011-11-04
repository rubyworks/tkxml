dir = File.dirname(__FILE__)

$:.unshift(dir + '/../lib')

require 'tkxml'

file  = File.open(dir + "/ui.xml")

tkxml = TkXML.new(file)

tkxml.build

