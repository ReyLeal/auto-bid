require 'httparty'
require 'nokogiri'
# THE CLASS BELOW GETS THE HTTPARTY JSON RESPONSE AND PARSES IT TO GET THE MILES IN BETWEEN
# TWO DESTINATIONS USING THE DESTINATIONS LATITUDE AND LONGITUDE
class MapsRequest
  attr_accessor :distance
  def initialize(orgLatitude, orgLongitude, destLatitude, destLongitude)
    @distance = HTTParty.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{orgLatitude},\
                #{orgLongitude}&destinations=#{destLatitude},#{destLongitude}&key=#{ENV['GOOGLE_MAPS_MATRIX_API_KEY']}")\
                ['rows'].first['elements'].first['distance']['text']
  end
end
# puts MapsRequest.new('25.8010000', '-80.3150568', '25.8044250', '-80.3150600').distance
