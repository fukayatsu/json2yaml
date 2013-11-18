require "json2yaml/version"
require 'json'
require 'yaml'

module Json2yaml
  def self.to_yaml(json)
    JSON.parse(json).to_yaml
  end

  def self.to_json(yaml)
    YAML.load(yaml).to_json
  end
end
