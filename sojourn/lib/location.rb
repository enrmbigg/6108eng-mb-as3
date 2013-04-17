require 'open-uri'
   require 'cgi'
   require'pp'
   YAHOO_GEOCODE_URL = 'http://local.yahooapis.com/MapsService/V1/
   geocode'
   YAHOO_APP_ID = '<18tHTL3c>'
   GEONAMES_SEARCH_URL = 'http://ws.geonames.org/search'
   GEONAMES_COUNTRY_URL = 'http://ws.geonames.org/countryInfo?country='
   class Location
   attr_accessor :location, :lat, :long, :city, :state, :country, :
   country_code, :currency, :timezone
   def initialize(location='England')
       hash = {:appid => YAHOO_APP_ID, :location => location }
       parameters = URI.escape(hash.to_a.collect {|pair| pair.join('=')}.
        join('&'))
       results = ''
       open(YAHOO_GEOCODE_URL + '?' + parameters) { |s| results =
            XmlSimple::xml_in(s.read, 'force_array' => false)['Result'] }
       if results.class == Array then
         cities = '<ol>'
         results.each {|res|
           if res['Country'] == 'US' or res['Country'] == 'CA'
             cities += "<li><a href='/trip/map?location=#{res['City']},
                     #{res['State']}, #{res['Country']}'>#{res['City']},
                     #{res['State']}, #{res['Country']}</a></li>"
           else
             cities += "<li><a href='/trip/map?location=#{res['City']},
                         #{res['Country']}'>#{res['City']},
                         #{res['Country']}</a></li>"
￼￼￼
           end 
}
         cities += '</ol>'
         raise "More than one city with the same name found! Please
               choose one from below:" + cities
       end
       @country_code = results['Country']
       @state_code = results['State']
       @lat = results['Latitude'].to_f
       @long = results['Longitude'].to_f
       hash = {:q => location, :maxRows => 1, :style => 'FULL' }
       parameters = URI.escape(hash.to_a.collect {|pair| pair.join('=')}.
                    join('&'))
       open(GEONAMES_SEARCH_URL + '?' + parameters) { |s| results =
           XmlSimple::xml_in(s.read, 'force_array' => false)['geoname'] }
       raise "Cannot find this city, please try again with a different
           state or country." if results == nil
       @city = results['name']
       @country = results['countryName']
       @timezone = results['timezone']['content']
           if @country_code == 'US' or @country_code == 'CA'
           @location = "#{@city}, #{@state_code}, #{@country}"
           else
           @location = "#{@city}, #{@country}"
           end
    end 
end