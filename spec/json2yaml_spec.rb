require 'spec_helper'

describe Json2yaml do
  FIXTURES_DIR = File.join(File.dirname(__FILE__), 'fixtures')

  context "with single data" do
    let(:json_str) { "{\"a\":\"b\"}\n" }
    let(:yaml_str) { "---\na: b\n" }
    let(:json_io)  { StringIO.new(json_str, "r") }
    let(:yaml_io)  { StringIO.new(yaml_str, "r") }
    context '.to_json' do
      it { expect(Json2yaml.to_yaml(json_io, []).reduce(&:+)).to eq(yaml_str) }
    end

    context '.to_yaml' do
      it { expect(Json2yaml.to_json(yaml_io, []).reduce(&:+)).to eq(json_str) }
    end
  end

  context "with multiple data" do
    let(:json_str) { "{\"a\":\"b\"}\n{\"c\":\"d\"}\n{\"e\":\"f\"}\n" }
    let(:yaml_str) { "---\na: b\n---\nc: d\n---\ne: f\n" }
    let(:json_io)  { StringIO.new(json_str, "r") }
    let(:yaml_io)  { StringIO.new(yaml_str, "r") }
    context '.to_json' do
      it { expect(Json2yaml.to_yaml(json_io, []).reduce(&:+)).to eq(yaml_str) }
    end

    context '.to_yaml' do
      it { expect(Json2yaml.to_json(yaml_io, []).reduce(&:+)).to eq(json_str) }
    end
  end

  context "load by arguments" do
    let(:test1_json_as_yaml) { "---\nfoo: bar\nfoobar: baz\n---\nqux: quux\n" }
    let(:test2_json_as_yaml) { "---\n- 1\n- true\n- false\n- \n" }
    let(:test1_yaml_as_json) { "{\"foo\":\"bar\",\"foobar\":\"baz\"}\n{\"qux\":\"quux\"}\n" }
    let(:test2_yaml_as_json) { "[1,true,false,null]\n" }
    let(:empty_io) { StringIO.new }

    context "with single argument" do
      context '.to_json' do
        let(:argv) { [File.join(FIXTURES_DIR, 'test1.yaml')] }
        it { expect(Json2yaml.to_json(empty_io, argv).reduce(&:+)).to eq(test1_yaml_as_json) }
      end

      context '.to_yaml' do
        let(:argv) { [File.join(FIXTURES_DIR, 'test1.json')] }
        it { expect(Json2yaml.to_yaml(empty_io, argv).reduce(&:+)).to eq(test1_json_as_yaml) }
      end
    end

    context "with multiple arguments" do
      context '.to_json' do
        let(:argv) { [File.join(FIXTURES_DIR, 'test1.yaml'), File.join(FIXTURES_DIR, 'test2.yaml')] }
        it { expect(Json2yaml.to_json(empty_io, argv).reduce(&:+)).to eq(test1_yaml_as_json + test2_yaml_as_json) }
      end

      context '.to_yaml' do
        let(:argv) { [File.join(FIXTURES_DIR, 'test1.json'), File.join(FIXTURES_DIR, 'test2.json')] }
        it { expect(Json2yaml.to_yaml(empty_io, argv).reduce(&:+)).to eq(test1_json_as_yaml + test2_json_as_yaml) }
      end
    end
  end
end
