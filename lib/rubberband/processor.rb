require 'open3'
require 'shellwords'

module RubberBand 
  class Processor
    attr_reader :command

    def initialize(input_file, output_file, options = Options.new)
      @input_file = input_file
      @output_file = output_file
      @errors = []

      if options.is_a?(String) || options.is_a?(Options)
        @raw_options = options
      elsif options.is_a?(Hash)
        @raw_options = Options.new(options)
      else
        raise ArgumentError, "Unknown options format '#{options.class}', should be either EncodingOptions, Hash or String."
      end
    end
    
    def binary
      binary_path = `which rubberband`
      if $? == 0
        binary_path.strip
      else
        raise "rubberband binary not found!"
      end
    end

    def run
      @command = "#{binary} #{@raw_options} '#{Shellwords.escape(@input_file)}' '#{Shellwords.escape(@output_file)}'"
      output  = ""

      Open3.popen3(@command) do |stdin, stdout, stderr|
        stderr.each("r") do |line| 
          output << line
        end
      end

      if convert_succeeded?
        true
      else
        errors = @errors.empty? ? "" : " Errors: #{@errors.join(", ")}. "
        raise "Failed encoding: #{errors}. \nCommand: #{@command}. \nFull output: #{output}"
      end
    end
    
    def convert_succeeded?
      unless File.exists?(@output_file)
        @errors << "no output file created"
        return false
      end
      true
    end
  
  end
end