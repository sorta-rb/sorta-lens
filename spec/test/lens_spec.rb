# frozen_string_literal: true

describe Sorta::Lens do
  it 'builds untyped' do
    expect(Sorta::Lens.on).to be_instance_of(Sorta::Lens::Untyped)
  end
  it 'builds typed' do
    expect(Sorta::Lens.typed.on).to be_instance_of(Sorta::Lens::Typed)
  end
end
