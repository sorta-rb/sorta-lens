describe Lens do
  it 'extracts' do
    lens = Lens.on(:a, :b)
    hash = { a: 1, b: 2, c: 3 }
    expect(lens.call(hash)).to eq({ a: 1, b: 2 })
  end

  it 'extracts from methods' do
    lens = Lens.on(:a, :b)
    object = TestContainer.new
    expect(lens.call(object)).to eq({ a: 1, b: 'Bar' })
  end

  it 'validates arguments' do
    expect { Lens.on('not a symbol') }.to raise_error(ArgumentError)
  end
end
