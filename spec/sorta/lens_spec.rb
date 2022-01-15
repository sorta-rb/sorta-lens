# frozen_string_literal: true

RSpec.describe Sorta::Lens do
  it "builds untyped" do
    expect(Sorta::Lens.on).to be_instance_of(Sorta::Lens::Untyped)
  end

  it "builds typed" do
    expect(Sorta::Lens.typed.on).to be_instance_of(Sorta::Lens::Typed)
  end

  it "returns builder" do
    expect(Sorta::Lens.build).to be_instance_of(Sorta::Lens::Builder)
  end
end
