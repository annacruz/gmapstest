# class Location < ActiveRecord::Base
class Location
  include MongoMapper::Document
  include Gmaps4rails::ActsAsGmappable

  # attr_accessible :address, :latitude, :longitude, :name
  # field :location, :type => Array, :geo => true, :lat => :latitude, :lng => :longitude
  # geo_index :location
  acts_as_gmappable :lat => 'latitude', :lng => 'longitude', 
                    :address => 'address', :normalized_address => 'address'

  key :name, String
  key :address, String
  key :latitude, Float
  key :longitude, Float
  key :gmaps, Boolean

  def gmaps4rails_address
    address
  end

  def gmaps4rails_infowindow
    "<h4>#{name}</h4>" << "<h4>#{address}</h4>"
  end

  def gmaps4rails_sidebar
    name 
  end

end
