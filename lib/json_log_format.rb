require "json_log_format/version"
require "json"

class JSONLogFormat
  def self.call(data)
    payload = data.transform_values do |value|
      if value.is_a?(Float)
        Kernel.format("%.2fms", value)
      else
        value
      end
    end

    JSON.dump(payload)
  end
end
