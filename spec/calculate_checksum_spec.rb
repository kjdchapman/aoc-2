require './lib/calculate_checksum'

describe CalculateChecksum do
  subject { described_class.new.execute(input) }

  context 'with empty input' do
    let(:input) { "" }

    it { is_expected.to eq 0 }
  end

  context 'for "aa" and "aaa"' do
    let(:input) { "aa\naaa" }

    it { is_expected.to eq 1 }
  end

  context 'for "a"' do
    let(:input) { "a" }

    it { is_expected.to eq 0 }
  end

  context 'for "aa"' do
    let(:input) { "aa" }

    it { is_expected.to eq 0 }
  end

  context 'for "aaa" and "aa"' do
    let(:input) { "aaa\naa" }

    it { is_expected.to eq 1 }
  end

  context 'for "bb" and "bbb"' do
    let(:input) { "bb\nbbb" }

    it { is_expected.to eq 1 }
  end

  context 'for "aa" and "aa" and "aaa"' do
    let(:input) { "aa\naa\naaa" }

    it { is_expected.to eq 2 }
  end

  context 'for example strings' do
    let(:input) { "abcdef\nbababc\nabbcde\nabcccd\naabcdd\nabcdee\nababab" }

    it { is_expected.to eq 12 }
  end
end
