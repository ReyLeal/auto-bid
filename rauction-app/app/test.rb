require 'httparty'
require 'nokogiri'




year = HTTParty.get("http://www.carqueryapi.com/api/0.3/?cmd=getMakes&year=1998")
p year
