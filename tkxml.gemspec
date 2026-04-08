Gem::Specification.new do |s|
  s.name        = 'tkxml'
  s.version     = '0.3.1'
  s.summary     = 'XML markup language for Tk user interfaces'
  s.description = 'TkXML is an XML markup language for generating Ruby/Tk ' \
                  'user interfaces, inspired by GTK\'s Glade format. ' \
                  'Originally written in April 2002.'
  s.authors     = ['Trans']
  s.email       = ['transfire@gmail.com']
  s.homepage    = 'https://github.com/rubyworks/tkxml'
  s.license     = 'BSD-2-Clause'

  s.files       = Dir['lib/**/*', 'NOTICE.rdoc', 'README.rdoc',
                      'HISTORY.rdoc', 'DEMO.rdoc', 'TKXML.txt']
  s.require_paths = ['lib']
end
