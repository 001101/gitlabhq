require 'spec_helper'

shared_examples 'ChronicDurationAttribute reader' do
  it 'contains dynamically created reader method' do
    expect(subject.class).to be_public_method_defined(virtual_field)
  end

  it 'outputs chronic duration formatted value' do
    subject.send("#{source_field}=", 120)

    expect(subject.send(virtual_field)).to eq('2m')
  end

  it 'outputs empty string when value set to nil' do
    subject.send("#{source_field}=", nil)

    expect(subject.send(virtual_field)).to be_empty
  end
end

shared_examples 'ChronicDurationAttribute writer' do
  it 'contains dynamically created writer method' do
    expect(subject.class).to be_public_method_defined("#{virtual_field}=")
  end

  it 'parses chronic duration input' do
    subject.send("#{virtual_field}=", '10m')

    expect(subject.send(source_field)).to eq(600)
  end

  it 'writes null when empty input is used' do
    subject.send("#{virtual_field}=", '')

    expect(subject.send(source_field)).to be_nil
  end
end

describe 'ChronicDurationAttribute' do
  let(:source_field) {:maximum_job_timeout}
  let(:virtual_field) {:maximum_job_timeout_human_readable}

  subject { Ci::Runner.new }

  it_behaves_like 'ChronicDurationAttribute reader'
  it_behaves_like 'ChronicDurationAttribute writer'
end

describe 'ChronicDurationAttribute - reader' do
  let(:source_field) {:used_timeout}
  let(:virtual_field) {:used_timeout_human_readable}
  subject {Ci::BuildMetadata.new}

  it "doesn't contain dynamically created writer method" do
    expect(subject.class).not_to be_public_method_defined("#{virtual_field}=")
  end

  it_behaves_like 'ChronicDurationAttribute reader'
end
