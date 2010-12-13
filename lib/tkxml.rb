# TkXML (2.04a)
# Copyright 2002 Thomas Sawyer (transami@runbox.com)
# April 2002 Alpha

require 'tk'

# A combination of Ruby/Tk + REXML to allow for fast and easy creation of Tk
# interfaces using standard XML
#
#   xml_file = File.open("ui.xml")
#   tkxml_instance = TkXML.new(xml_file)
#   tkxml_instance.build
#
class TkXML

  # Access to project metadata.
  def self.metadata
    @metadata ||= (
      require 'yaml'
      YAML.load(File.new(File.dirname(__FILE__) + '/tkxml.yml'))
    )
  end

  # Access metadata as constants.
  def self.const_missing(name)
    key = name.to_s.downcase
    metadata[key] || super(name)
  end

  # TODO: here only b/c Ruby 1.8.x is broke
  VERSION = metadata['version']

  #
  def initialize(source, type=:nokogiri)
    @widget = {}
    @widget_stack = []
    @parent = nil

    case type
    when :nokogiri
      require 'tkxml/nokogiri'
    else
      require 'tkxml/rexml'
    end

    parse(source)
  end

  #
  def build
    Tk.mainloop
  end

  def start
    ## get parent, the widget on the bottom of the stack
    @parent = @widget_stack.last
  end

  #
  def start_widget(name, attrs)
    ## create widget
    puts "Creating Widget: #{name} of #{@parent}"

    ##
    attrs = assoc_to_hash(attrs)

    widget_class = "Tk" + name.capitalize
    widget_name = attrs['name']

    if @parent == nil
      @widget[widget_name] = Tk.const_get(widget_class).new
    else
      @widget[widget_name] = Tk.const_get(widget_class).new(@parent)
    end

    ## assign the widget properties
    attrs.each do |n, v|
      if not n == 'name'
        puts "   #{n} => #{v}"
        @widget[widget_name].send(n, v)
      end
    end

    ## push widget on to the stack
    @widget_stack.push(@widget[widget_name])
  end

  #
  def end_widget(name)
    @parent = @widget_stack[-2]
    current = @widget_stack.last

    case name.downcase
    when "menu"
      @parent.menu(current)
    end

    # pop current widget off of stack
    @widget_stack.pop

    puts "End Widget: #{name}"
  end

  #
  def start_method(name, attrs)
    ## apply method
    puts "Applying Method: #{name} to #{@parent}"

    ##
    attrs = assoc_to_hash(attrs)

    ## assign the method's parameters
    p_arr  = []  # array for parameters to be passed
    p_init = {}  # for the ordered arguments _1 _2 etc.
    p_hash = {}  # for all other named parameters

    ## weed out the ordered parameters from the hash parameters
    attrs.each do |n, v|
      puts "   #{n} => #{v}"
      if n[0..0] == "_"
        p_init[n] = v
      else
        p_hash[n] = v
      end
    end

    ## sort the ordered parameters based on the hash key
    ## note: this converts p_init into an associative array
    ## then place each one in the parameter array
    if not p_init.empty?
      p_init.sort
      p_init.each do |a|
        p_arr.push a[1]
      end
    end

    ## now add the hash to the array if there is one
    if not p_hash.empty?
      p_arr.push p_hash
    end

    ## call the method
    @parent.send(name, *p_arr)
  end

  #
  def end_method(name)
    puts "End Method: #{name}"
  end

  private

  # Looks like the attributes object given is nothing more then
  # a array in an array. how lame! This wll turn it into a hash.
  def assoc_to_hash(array)
    return array if Hash === array
    hash = {}
    array.each do |a|
      hash[a[0]] = a[1]
    end
    hash
  end

end

