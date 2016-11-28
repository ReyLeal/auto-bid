require 'httparty'
require 'nokogiri'


@makes = HTTParty.get("http://www.carqueryapi.com/api/0.3/?cmd=getMakes&year=2010")

puts @makes
