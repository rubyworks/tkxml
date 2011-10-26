require 'tkxml'

file  = File.open("demo/ui.xml")
tkxml = TkXML.new(file)
tkxml.build

