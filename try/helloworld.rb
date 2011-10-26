# TkXML
# Copyright (c) 2002 Thomas Sawyer
#
# Example: TkXML #1

require 'tkxml'

source = %Q{
  <root>
    <label text='Hello World!'>
      <_pack side='right'/>
    </label>
  </root>
}

tkxml = TkXML.new(source)
tkxml.build

