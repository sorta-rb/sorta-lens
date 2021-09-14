describe TypedLens do
  it 'extracts from methods' do
    lens = TypedLens.on(a: Integer, b: String)
    object = TestContainer.new
    expect(lens.call(object)).to eq({ a: 1, b: 'Bar' })
  end

  it 'extracts from hash' do
    lens = TypedLens.on(a: String, b: Integer)
    hash = { a: 'Foo', b: 2, c: 3 }
    expect(lens.call(hash)).to eq({ a: 'Foo', b: 2 })
  end

  it 'validates arguments' do
    expect { TypedLens.on('Not a symbol') }.to raise_error(ArgumentError)
    expect { TypedLens.on('Not a symbol' => 'Not a symbol') }.to raise_error(ArgumentError)
  end

  it 'checks types' do
    lens = TypedLens.on(a: String)
    hash = { a: 1 }
    expect { lens.call(hash) }.to raise_error(TypedLens::TypeError)
  end
end
