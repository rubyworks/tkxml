require 'nokogiri'

class TkXML

  def parse(source)
    listener = Nokogiri_Listener.new(self)
    parser   = Nokogiri::XML::SAX::Parser.new(listener)
    parser.parse(source)
  end

  #
  class Nokogiri_Listener < Nokogiri::XML::SAX::Document

    #
    attr :tk

    #
    def initialize(tk)
      super()
      @tk = tk
    end

    #
    def start_element(name, attrs=[])
      tk.start

      ## pull off the tag name if prefixed with the Tk namespace
      name  = name.sub(/^Tk:/, '')

      attrs = Hash[*attrs]

      ## is it a method call or a new widget?
      if name[0..0] == '_'
        name = name[1..-1]
        tk.start_method(name, attrs)
      else
        tk.start_widget(name, attrs)
      end
    end

    #
    def end_element(name)
      ## pull off the tag name if prefixed with the Tk namespace
      name = name.sub(/^Tk:/, '')

      # if method then we're finish
      # else if widget then finish creation and pop off the widget stack
      if name[0..0] == "_"
        name = name[1..-1]
        tk.end_method(name)
      else
        tk.end_widget(name)
      end
    end

  end

end
