describe Sorta::Lens::Untyped do
  it 'extracts from hash' do
    lens = described_class.on(:a, :b)
    hash = { a: 1, b: 2, c: 3 }
    expect(lens.call(hash)).to eq({ a: 1, b: 2 })
  end

  it 'extracts from methods' do
    lens = described_class.on(:a, :b)
    object = double
    allow(object).to receive_messages(a: 1, b: 'Bar')
    expect(lens.call(object)).to eq({ a: 1, b: 'Bar' })
  end

  it 'validates arguments' do
    expect { described_class.on('not a symbol') }.to raise_error(ArgumentError)
  end
end
