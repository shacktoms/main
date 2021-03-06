require File.dirname(__FILE__) + '/../../../spec_helper'
require 'rexml/document'

describe "REXML::Attributes#each_attribute" do
  it "iterates over the attributes yielding actual Attribute objects" do
    e = REXML::Element.new("root")
    name = REXML::Attribute.new("name", "Joe")
    ns_uri = REXML::Attribute.new("xmlns:ns", "http://some_uri")
    e.add_attribute name
    e.add_attribute ns_uri

    attributes = []

    e.attributes.each_attribute do |attr|
      attributes << attr 
    end

    attributes.first.should == name
    attributes.last.should == ns_uri
  end
end



