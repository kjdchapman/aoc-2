require './lib/find_similar_codes'

describe FindSimilarCodes do
  subject { described_class.new.execute(input) }

  context 'with an input of "ab", "ac"' do
    let(:input) { "ab\nac" }

    it { is_expected.to eq "a" }
  end

  context 'with an input of "ba", "bc"' do
    let(:input) { "ba\nbc" }

    it { is_expected.to eq "b" }
  end

  context 'with an input of "abc", "abd"' do
    let(:input) { "abc\nabd" }

    it { is_expected.to eq "ab" }
  end

  context 'with an input of "xyz", "abc", "abd"' do
    let(:input) { "xyz\nabc\nabd" }

    it { is_expected.to eq "ab" }
  end

  context 'with an input of "jkl", "xyz", "abc", "abd"' do
    let(:input) { "jkl\nxyz\nabc\nabd" }

    it { is_expected.to eq "ab" }
  end

  context 'for example strings' do
    let(:input) { "abcde\nfghij\nklmno\npqrst\nfguij\naxcye\nwvxyz" }

    it { is_expected.to eq "fgij" }
  end

  context 'for a match out of order' do
    let(:input) { "abcd\nabde\nabce" }

    it { is_expected.to eq "abc" }
  end

  context 'for strings with repeat letters' do
    let(:input) { "aabc\naabd" }

    it { is_expected.to eq "aab" }
  end

  context 'for the file' do
    let(:input) { File.read("./input.txt") }

    it { is_expected.to eq "tjxmoewpdkyaihvrndfluwbzc" }
  end
end
