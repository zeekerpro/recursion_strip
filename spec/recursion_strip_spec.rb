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

    it "for string" do
      str = "hello world   "
      str.instance_eval do
        class << self
          include RecursionStrip
        end
      end
      expect(str.strip!).to eq "hello world"
    end

  end
end
