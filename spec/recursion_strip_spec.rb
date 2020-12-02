require 'recursion_strip'

describe RecursionStrip do
  context "when included" do

    it "for array" do
      class Array
        include RecursionStrip
      end
      a = ["hello   ", "  world"] 
      expect(a.respond_to? :strip!).to eq true
      expect(a.strip!).to eq ["hello", "world"]
    end

    it "for string instance" do
      str = "hello world   "
      str.singleton_class.class_eval do
          include RecursionStrip
      end
      expect(str.strip!).to eq "hello world"
    end

  end
end
