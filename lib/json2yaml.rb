require "json2yaml/version"
require 'yajl/json_gem'
require 'yaml'

module Json2yaml
  def self.to_yaml(json_stream, argv)
    inputs = argv.empty? ? [json_stream] : argv.map{|file| open(file) }

    Enumerator.new do |yielder|
      inputs.each do |input|
        Yajl::Parser.new.parse(input) do |d|
          yielder.yield d.to_yaml
        end
      end
    end
  end

  def self.to_json(yaml_stream, argv)
    inputs = argv.empty? ? [yaml_stream] : argv.map{|file| open(file) }

    Enumerator.new do |yielder|
      inputs.each do |input|
        YAML.load_stream(input) do |d|
          yielder.yield d.to_json + "\n"
        end
      end
    end
  end
end
