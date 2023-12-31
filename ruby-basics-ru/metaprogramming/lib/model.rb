# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    def base.attribute(name, options)
      @@attributes ||= {}
      @@attributes[name] = options.each_with_object({}) do |(key, value), h|
        h[key] = value
      end

      define_method name do
        instance_variable_get "@#{name}"
      end

      define_method "#{name}=" do |value|
        type = options.fetch(:type)
        typed_value = case type
                      when :boolean
                        value || false
                      when :string
                        value.nil? ? nil : value.to_s
                      when :integer
                        value.to_i
                      when :datetime
                        value.nil? ? nil : DateTime.parse(value)
                      else
                        value
                      end
        default = options.fetch(:default, nil)
        instance_variable_set "@#{name}", typed_value || default
      end
    end
  end

  def initialize(data = {})
    @@attributes.each_key do |key|
      value = data.fetch(key, nil)
      send("#{key}=", value)
    end
  end

  def attributes
    @@attributes.each_with_object({}) do |(key, _), h|
      h[key] = send(key)
    end
  end
end
# END
