require 'httparty'
require 'nokogiri'

class MapsRequest
  attr_accessor :distance

  def initialize(orgLatitude, orgLongitude, destLatitude, destLongitude)
    @distance = HTTParty.get("https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=#{orgLatitude},\
                #{orgLongitude}&destinations=#{destLatitude},#{destLongitude}&key=AIzaSyAbs34ta5k34QdfBQUf-6nR0x5I5GMnWqY")\
                ['rows'].first['elements'].first['distance']['text']
  end
end
# puts MapsRequest.new('25.8010000', '-80.3150568', '25.8044250', '-80.3150600').distance
