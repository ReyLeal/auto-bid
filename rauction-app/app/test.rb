require 'httparty'
require 'nokogiri'


@makes = HTTParty.get("http://www.carqueryapi.com/api/0.3/?cmd=getMakes&year=2010")

puts @makes


https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=25.6852342,-80.4175613&destinations=25.7583541,-80.3440679&key=AIzaSyAbs34ta5k34QdfBQUf-6nR0x5I5GMnWqY
