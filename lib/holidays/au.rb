# encoding: utf-8
module Holidays
  # This file is generated by the Ruby Holidays gem.
  #
  # Definitions loaded: data/au.yaml
  #
  # To use the definitions in this file, load it right after you load the 
  # Holiday gem:
  #
  #   require 'holidays'
  #   require 'holidays/au'
  #
  # All the definitions are available at https://github.com/alexdunae/holidays
  module AU # :nodoc:
    def self.defined_regions
      [:au, :au_nsw, :au_tas, :au_wa, :au_vic, :au_qld, :au_nt, :au_act, :au_sa, :au_qld_brisbane]
    end

    def self.holidays_by_month
      {
              0 => [{:function => lambda { |year| Holidays.easter(year)-2 }, :function_id => "easter(year)-2", :name => "Good Friday", :regions => [:au]},
            {:function => lambda { |year| Holidays.easter(year)-1 }, :function_id => "easter(year)-1", :name => "Easter Saturday", :regions => [:au]},
            {:function => lambda { |year| Holidays.easter(year) }, :function_id => "easter(year)", :name => "Easter Sunday", :regions => [:au_nsw]},
            {:function => lambda { |year| Holidays.easter(year)+1 }, :function_id => "easter(year)+1", :name => "Easter Monday", :regions => [:au]},
            {:function => lambda { |year| Holidays.easter(year)+2 }, :function_id => "easter(year)+2", :name => "Easter Monday", :regions => [:au_tas]}],
      1 => [{:mday => 1, :name => "New Year's Day", :regions => [:au]},
            {:mday => 26, :name => "Australia Day", :regions => [:au]}],
      3 => [{:wday => 1, :week => 1, :name => "Labour Day", :regions => [:au_wa]},
            {:wday => 1, :week => 2, :name => "Eight Hours Day", :regions => [:au_tas]},
            {:wday => 1, :week => 2, :name => "Labour Day", :regions => [:au_vic]}],
      4 => [{:mday => 25, :name => "ANZAC Day", :regions => [:au]}],
      5 => [{:function => lambda { |year| Holidays.qld_labour_day_may(year) }, :function_id => "qld_labour_day_may(year)", :name => "Labour Day", :regions => [:au_qld]},
            {:wday => 1, :week => 1, :name => "May Day", :regions => [:au_nt]}],
      6 => [{:wday => 1, :week => 1, :name => "Foundation Day", :regions => [:au_wa]},
            {:wday => 1, :week => 2, :name => "Queen's Birthday", :regions => [:au_act, :au_nsw, :au_sa, :au_qld, :au_tas, :au_nt, :au_vic]},
            {:mday => 6, :type => :informal, :name => "Queensland Day", :regions => [:au_qld]}],
      8 => [{:wday => 3, :week => -3, :name => "Ekka", :regions => [:au_qld_brisbane]}],
      10 => [{:wday => 1, :week => 1, :name => "Labour Day", :regions => [:au_act, :au_nsw, :au_sa]},
            {:function => lambda { |year| Holidays.qld_labour_day_october(year) }, :function_id => "qld_labour_day_october(year)", :name => "Labour Day", :regions => [:au_qld]},
            {:function => lambda { |year| Holidays.qld_queens_bday_october(year) }, :function_id => "qld_queens_bday_october(year)", :name => "Queen's Birthday", :regions => [:au_qld]}],
      12 => [{:mday => 25, :name => "Christmas Day", :regions => [:au]},
            {:mday => 26, :name => "Boxing Day", :regions => [:au]}]
      }
    end
  end

# http://www.justice.qld.gov.au/fair-and-safe-work/industrial-relations/public-holidays/dates
# celebrated twice in 2012
def self.qld_queens_bday_october(year)
  year == 2012 ? 1 : nil
end


# http://www.justice.qld.gov.au/fair-and-safe-work/industrial-relations/public-holidays/dates
# changed from may to october after 2012
def self.qld_labour_day_may(year)
  year <= 2012 ? Date.calculate_mday(year, 5, 1, 1) : nil
end


# http://www.justice.qld.gov.au/fair-and-safe-work/industrial-relations/public-holidays/dates
# changed from may to october after 2012
def self.qld_labour_day_october(year)
  year <= 2012 ? nil : Date.calculate_mday(year, 10, 1, 1)
end



end

Holidays.merge_defs(Holidays::AU.defined_regions, Holidays::AU.holidays_by_month)
