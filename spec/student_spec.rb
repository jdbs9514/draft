require_relative './student'

describe Student do
  context 'testing the student class' do
    student = Student.new('Ruby', 18, 'Josue', true)

    it 'this class return an object' do
      expect(student.class) == Student
    end

    it 'parameters return the correct values' do
      expect(student.classroom).to eq 'Ruby'
      expect(student.age).to eq 18
      expect(student.name).to eq 'Josue'
      expect(student.parent_permission).to eq true
    end

    it 'instace of Student class' do
      expect(student.play_hooky).to eq "¯\(ツ)/¯"
    end
  end
end
