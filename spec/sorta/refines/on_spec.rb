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
  let(:lens) { Sorta::Lens.on(:a, :b) }

  describe "#on" do
    it "extracts from hash" do
      object = { a: 1, b: 2, c: 3 }
      test_instance = RefineGetterUserTestClass.new(object, double)
      result = test_instance.call_on(lens)

      expect(result).to eq(a: 1, b: 2)
    end

    it "extracts from methods" do
      object = double(a: 1, b: "Bar")
      test_instance = RefineGetterUserTestClass.new(object, double)
      result = test_instance.call_on(lens)

      expect(result).to eq(a: 1, b: "Bar")
    end
  end

  describe "#map_on" do
    it "extracts from hash" do
      array = [{ a: 1, b: 2, c: 3 }]
      test_instance = RefineGetterUserTestClass.new(double, array)
      result = test_instance.call_map_on(lens)

      expect(result).to eq([{ a: 1, b: 2 }])
    end

    it "extracts from methods" do
      array = [double(a: 1, b: "Bar")]
      test_instance = RefineGetterUserTestClass.new(double, array)
      result = test_instance.call_map_on(lens)

      expect(result).to eq([{ a: 1, b: "Bar" }])
    end
  end
end
