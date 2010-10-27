require 'rexml/document'

class TkXML

  #
  def parse(source)
    listener = REXML_Listener.new(self)
    REXML::Document.parse_stream(source, listener)
  end

  # REXML Listener
  class REXML_Listener

    #
    attr :tk

    #
    def initialize(tk)
      super()
      @tk = tk
    end

    #
    def tag_start(name, attributes)
      tk.start

      ## pull off the tag name if prefixed with the Tk namespace
      if name[0..2] == "Tk:"
        tag_name = name[3..name.length]
      else
        tag_name = name
      end

      ## is it a method call or a new widget?
      if tag_name[0..0] == '_'
        name = tag_name[1..tag_name.length]
        tk.start_method(name, attributes)
      else
        tk.start_widget(name, attributes)
      end
    end

    #
    def tag_end(name)
      # pull off the tag name if prefixed with the Tk namespace
      if name[0..2] == "Tk:"
        tag_name = name[3..name.length]
      else
        tag_name = name
      end

      # if method then we're finish
      # else if widget then finish creation and pop off the widget stack
      if tag_name[0..0] == "_"
        name = tag_name[1..tag_name.length]
        tk.end_method(name)
      else
        tk.end_widget(name)
      end
    end

    #
    def text(free_radical)
      if not free_radical.strip == ""
        puts "Error: TkXML does not use XML text entries: #{free_radical}"
      end
    end

  end

end
