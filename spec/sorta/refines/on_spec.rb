# frozen_string_literal: true

class RefineGetterUserTestClass
  using Sorta::Lens::Refines::Getter

  def initialize(object, array)
    @object = object
    @array = array
  end

  def call_on(lens)
    @object.on(lens)
  end

  def call_map_on(lens)
    @array.map_on(lens)
  end
end

RSpec.describe Sorta::Lens::Refines::Getter do
  let(:test_instance) { RefineGetterUserTestClass.new(object, array) }
  let(:lens) { Sorta::Lens.on(:a, :b) }

  let(:object) { double("Placeholder Object") }
  let(:array) { double("Placeholder Array") }

  describe "#on" do
    subject { test_instance.call_on(lens) }

    describe  "extracts from hash" do
      let(:object) { { a: 1, b: 2, c: 3 } }

      it { is_expected.to eq(a: 1, b: 2) }
    end

    describe "extracts from methods" do
      let(:object) { double(a: 1, b: "Bar") }

      it { is_expected.to eq(a: 1, b: "Bar") }
    end
  end

  describe "#map_on" do
    subject { test_instance.call_map_on(lens) }

    describe  "extracts from hash" do
      let(:array) { [{ a: 1, b: 2, c: 3 }] }

      it { is_expected.to eq([{ a: 1, b: 2 }]) }
    end

    describe "extracts from methods" do
      let(:array) { [double(a: 1, b: "Bar")] }

      it { is_expected.to eq([{ a: 1, b: "Bar" }]) }
    end
  end
end
