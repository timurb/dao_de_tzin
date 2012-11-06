#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'nokogiri'
require 'open-uri'
require 'ap'

basepath = "translate/288"

def uri_for(path)
  basehost = "http://bronislav.ru"

  "#{basehost}/#{path}"
end

main = Nokogiri::HTML( open( uri_for( basepath )))

chapters = main.css('a#active,a#menu').map {|element| uri_for( element.attributes["href"].value )}
ap chapters
