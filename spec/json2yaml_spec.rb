require 'spec_helper'

describe Json2yaml do
  context "with single data" do
    let(:json_str) { "{\"a\":\"b\"}\n" }
    let(:yaml_str) { "---\na: b\n" }
    let(:json_io)  { StringIO.new(json_str, "r") }
    let(:yaml_io)  { StringIO.new(yaml_str, "r") }
    context '.to_json' do
      it { expect(Json2yaml.to_yaml(json_io).reduce(&:+)).to eq(yaml_str) }
    end

    context '.to_yaml' do
      it { expect(Json2yaml.to_json(yaml_io).reduce(&:+)).to eq(json_str) }
    end
  end

  context "with multiple data" do
    let(:json_str) { "{\"a\":\"b\"}\n{\"c\":\"d\"}\n{\"e\":\"f\"}\n" }
    let(:yaml_str) { "---\na: b\n---\nc: d\n---\ne: f\n" }
    let(:json_io)  { StringIO.new(json_str, "r") }
    let(:yaml_io)  { StringIO.new(yaml_str, "r") }
    context '.to_json' do
      it { expect(Json2yaml.to_yaml(json_io).reduce(&:+)).to eq(yaml_str) }
    end

    context '.to_yaml' do
      it { expect(Json2yaml.to_json(yaml_io).reduce(&:+)).to eq(json_str) }
    end
  end
end
