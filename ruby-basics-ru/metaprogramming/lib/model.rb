# frozen_string_literal: true

# BEGIN
class Cat

  def self.my_attr_accessor *attributes
    attributes.each do |attribute|
      # Getter
      define_method attribute do
        self.instance_variable_get "@#{attribute}"
      end
      ########

      # Setter
      define_method "#{attribute}=" do |value|
        self.instance_variable_set "@#{attribute}", value
      end
      ########
    end
  end

  my_attr_accessor :name, :age, :weight

  def initialize name, age, weight
    @name, @age, @weight = name, age, weight
  end

end
# END

c = Cat.new(1,2,3)
puts c.name