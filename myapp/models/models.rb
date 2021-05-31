class Dog < Sequel::Model
  many_to_one :person
  def validate
    super
    errors.add(:name, 'must be present') if name.empty?
    errors.add(:breed, 'must be present') if breed.empty?
  end
end

class Owner < Sequel::Model
  one_to_many :dogs
  def validate
    super
    errors.add(:name, 'must be present') if name.empty?
  end
end
