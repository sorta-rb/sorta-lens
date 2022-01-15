# frozen_string_literal: true

RSpec.describe Sorta::Lens::Builder do
  it "builds untyped" do
    lens = Sorta::Lens::Builder.new.on
    expect(lens).to be_instance_of Sorta::Lens::Untyped
  end

  it "builds typed" do
    lens = Sorta::Lens::Builder.new.typed.on
    expect(lens).to be_instance_of Sorta::Lens::Typed
  end

  describe "not implemented" do
    it "builds untyped indifferent" do
      expect { Sorta::Lens::Builder.new.indifferent.on }
        .to raise_error(NotImplementedError)
    end

    it "builds typed indifferent" do
      expect { Sorta::Lens::Builder.new.typed.indifferent.on }
        .to raise_error(NotImplementedError)
    end
  end
end
