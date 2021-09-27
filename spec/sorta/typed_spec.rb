# frozen_string_literal: true

RSpec.describe Sorta::Lens::Typed do
  it "extracts from methods" do
    lens = described_class.on(a: Integer, b: String)
    object = double
    allow(object).to receive_messages(a: 1, b: "Bar")
    expect(lens.call(object)).to eq({ a: 1, b: "Bar" })
  end

  it "extracts from hash" do
    lens = described_class.on(a: String, b: Integer)
    hash = { a: "Foo", b: 2, c: 3 }
    expect(lens.call(hash)).to eq({ a: "Foo", b: 2 })
  end

  it "validates arguments" do
    expect { described_class.on("Not a symbol") }.to raise_error(ArgumentError)
    expect { described_class.on("Not a symbol" => "Not a symbol") }.to raise_error(ArgumentError)
  end

  it "checks types" do
    lens = described_class.on(a: String)
    hash = { a: 1 }
    expect { lens.call(hash) }.to raise_error(Sorta::TypeError)
  end
end
