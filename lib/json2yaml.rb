require "json2yaml/version"
require 'yajl/json_gem'
require 'yaml'

module Json2yaml
  def self.to_yaml(json_stream)
    Enumerator.new do |yielder|
      Yajl::Parser.new.parse(json_stream) do |d|
        yielder.yield d.to_yaml
      end
    end
  end

  def self.to_json(yaml_stream)
    Enumerator.new do |yielder|
      YAML.load_stream(yaml_stream) do |d|
        yielder.yield d.to_json + "\n"
      end
    end
  end
end
