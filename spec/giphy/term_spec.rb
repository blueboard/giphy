require 'spec_helper'

describe Giphy::Term do
  let(:invalid_hash) { {} }
  let(:valid_hash) { { 'name' => 'fooname' } }

  context 'when iniatialized with a valid hash' do
    subject { described_class.new(valid_hash) }

    its(:name) { should eq(valid_hash['name']) }
  end

  context 'when initialized with an empty/invalid hash' do
    subject { described_class.new(invalid_hash) }

    it { expect { subject.name }.to raise_error(KeyError) }
  end

  describe '.build_batch_from' do
    subject { described_class.build_batch_from(batch) }

    let(:batch) { [valid_hash, valid_hash] }

    it 'creates a Giphy::Term instance for each array element' do
      expect(subject.size).to eq(batch.size)

      subject.each { |term| expect(term).to be_a(Giphy::Term) }
    end
  end
end
