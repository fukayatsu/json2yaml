require 'spec_helper'

describe Json2yaml do
  let(:json_str) { "{\"a\":\"b\"}" }
  let(:yaml_str) { "---\na: b\n" }
  context '.to_json' do
    it { expect(Json2yaml.to_yaml(json_str)).to eq(yaml_str) }
  end

  context '.to_yaml' do
    it { expect(Json2yaml.to_json(yaml_str)).to eq(json_str) }
  end
end