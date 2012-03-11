module RubberBand
  class Options < Hash
    BINARY_OPTIONS = %w{formant precise realtime no_threads threads 
                        no_transients bl_transients no_lamination 
                        window_long window_short detector_perc 
                        detector_soft pitch_hq}

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
    
    def convert_duration(value)
      "--duration #{value}"
    end
    
    def convert_pitch(value)
      "--pitch #{value}"
    end
    
    def convert_frequency(value)
      "--frequency #{value}"
    end
    
    def convert_timemap(value)
      "--timemap \"#{value}\""
    end
    
    def convert_crisp(value)
      "--crisp #{value}"
    end
    
    def self.convert_binary_params(name)
      class_eval "
      private
      def convert_#{name}(value)
        if value
          '--#{name}'
        else
          ''
        end
      end"
    end

    BINARY_OPTIONS.each do |name|
        convert_binary_params name.to_sym
    end
  end
end