module Rubberband
  class Options < Hash
    def initialize(options={})
      merge!(options)
    end
    
    def to_s
      params = collect do |key, value|
        send("convert_#{key}", value) if value && supports_option?(key)
      end

      params_string = params.join(" ")
      params_string << " -q"
      params_string
    end
    
    private
    def supports_option?(option)
      option = RUBY_VERSION < "1.9" ? "convert_#{option}" : "convert_#{option}".to_sym
      private_methods.include?(option)
    end

    def convert_time(value)
      "--time #{value}"
    end
    
    def convert_tempo(value)
      "--tempo #{value}"
    end
  end
end