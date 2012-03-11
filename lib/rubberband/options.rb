module Rubberband
  class Options < Hash
    def initialized(options={})
      merge!(options)
    end
    
    def to_s
      params = collect do |key, val|
        send("convert_#{key}", value) if value && supports_option?(key)
      end

      params_string = params.join(" ")
      params_string << " -q"
      params_string
    end
  end
end