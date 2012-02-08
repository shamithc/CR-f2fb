require 'rubygems'
require 'time'
#require 'date'


class TimeFormat
  def convert_zone(to_zone)
    original_zone = ENV["TZ"]
    utc_time = dup.gmtime
    ENV["TZ"] = to_zone
    to_zone_time = utc_time.localtime
    ENV["TZ"] = original_zone
    return to_zone_time
  end
end

t = TimeFormat.new
t.convert_zone("US/Pacific")

