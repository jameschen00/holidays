module Holidays
  # This file is generated by the Ruby Holiday gem.
  #
  # Definitions loaded: data/mx.yaml, data/common_methods.yaml, data/north_america_informal.yaml
  #
  # To use the definitions in the file, load them right after you load the 
  # Holiday gem:
  #
  #   require 'holidays'
  #   require 'path/to/mx'
  #
  # More definitions are available at http://code.dunae.ca/holidays.
  module MX # :nodoc:
    DEFINED_REGIONS = [:mx, :us, :ca]

    HOLIDAYS_BY_MONTH = {
      5 => [{:mday => 1, :name => "D\xC3\xADa del Trabajo", :regions => [:mx]},
            {:mday => 5, :name => "La Batalla de Puebla", :regions => [:mx]},
            {:wday => 0, :week => 3, :type => :informal, :name => "Father's Day", :regions => [:us, :ca]}],
      0 => [{:function => lambda { |year| easter(year)-3 }, :name => "Good Thursday", :regions => [:mx]},
            {:function => lambda { |year| easter(year)-2 }, :name => "Good Friday", :regions => [:mx, :us]},
            {:function => lambda { |year| easter(year) }, :name => "Easter Sunday", :regions => [:mx]}],
      11 => [{:mday => 2, :name => "Dia de Muertos", :regions => [:mx]},
            {:wday => 1, :week => 3, :name => "D\xC3\xADa de la Revoluci\xC3\xB3n", :regions => [:mx]}],
      1 => [{:mday => 1, :name => "New Year's Day", :regions => [:mx]},
            {:mday => 2, :name => "New Year's Day", :regions => [:mx]}],
      12 => [{:mday => 12, :name => "Our Lady of Guadalupe's day", :regions => [:mx]},
            {:mday => 25, :name => "Christmas Day", :regions => [:mx]}],
      2 => [{:wday => 1, :week => 1, :name => "D\xC3\xADa de la Constituci\xC3\xB3n", :regions => [:mx]},
            {:mday => 2, :type => :informal, :name => "Groundhog Day", :regions => [:us, :ca]},
            {:mday => 14, :type => :informal, :name => "Valentine's Day", :regions => [:us, :ca]}],
      3 => [{:wday => 1, :week => 3, :name => "Natalicio de Benito Ju\xC3\xA1rez", :regions => [:mx]},
            {:mday => 17, :type => :informal, :name => "St. Patrick's Day", :regions => [:us, :ca]}],
      9 => [{:mday => 16, :name => "D\xC3\xADa de Independencia", :regions => [:mx]}],
      4 => [{:mday => 1, :type => :informal, :name => "April Fool's Day", :regions => [:us, :ca]},
            {:mday => 22, :type => :informal, :name => "Earth Day", :regions => [:us, :ca]}],
      10 => [{:mday => 31, :type => :informal, :name => "Halloween", :regions => [:us, :ca]}]
    }

# Get the date of Easter in a given year.
#
# +year+ must be a valid Gregorian year.
#
# Returns a Date object.
#--
# from http://snippets.dzone.com/posts/show/765
# TODO: check year to ensure Gregorian
def self.easter(year)
  y = year
  a = y % 19
  b = y / 100
  c = y % 100
  d = b / 4
  e = b % 4
  f = (b + 8) / 25
  g = (b - f + 1) / 3
  h = (19 * a + b - d - g + 15) % 30
  i = c / 4
  k = c % 4
  l = (32 + 2 * e + 2 * i - h - k) % 7
  m = (a + 11 * h + 22 * l) / 451
  month = (h + l - 7 * m + 114) / 31
  day = ((h + l - 7 * m + 114) % 31) + 1
  Date.civil(year, month, day)
end



  end
end

Holidays.merge_defs(Holidays::MX::DEFINED_REGIONS, Holidays::MX::HOLIDAYS_BY_MONTH)