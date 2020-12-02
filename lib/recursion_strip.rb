require "recursion_strip/version"

module RecursionStrip
  class Error < StandardError; end
  # Your code goes here...

  STRIP_LAMBDA = -> (params) {
    each_method = :each_value if params.respond_to? :each_value
    each_method = :each if params.is_a?(Array)
    if each_method
      params.send each_method do |value|
        value.strip! if ( value&.is_a?(String) && !value&.frozen? )
        STRIP_LAMBDA.call(value) unless value&.is_a?(String)
      end
    end
  }

  def self.included(other)
    # 避免覆盖原有的 strip! 方法，如 String 自带该方法则不定义
    unless other.instance_methods.include? :strip! then
      other.class_eval do
        define_method :strip! do
          STRIP_LAMBDA.call(self)
        end
      end
    end
  end
end
