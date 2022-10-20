require_relative './person'

describe Person do
  context 'testing Person class' do
    person = Person.new(16, 'Patrick', true)
    it 'return an object' do
      expect(person.class) == Person
    end

    it 'retrun the correct values of parameters' do
      expect(person.age).to eq 16
      expect(person.name).to eq 'Patrick'
      expect(person.parent_permission).to eq true
    end
  end

  context 'instance of the person class' do
    person2 = Person.new(16, 'Julian', true)
    it 'return true all the time' do
      expect(person2.can_use_services?).to eq true
    end
  end
end
