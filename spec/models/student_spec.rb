require 'rails_helper'

RSpec.describe Student, type: :model do
  # write your student model here
  
  describe 'attributes' do
    # it 'has a name' do 
    # end

    # it 'has student_number' do
    # end

    # it 'has GPA' do 
    # end

    #checks that the cloumn exists in the database?
    it{ should respond_to :name }
    it { should respond_to :student_number }
    it { should respond_to :gpa}
  end

  #check that data is correct in columns (validations)
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :student_number}
    it { should validate_presence_of :gpa}

    
    # it { should validate_numericality_of :student_number }
    # it { should validate_numericality_of :gpa}
    # it 'has a unique name' do 
    #   before(:each) do
    #     @student = Student.create(
    #       name: 'jill',
    #       student_number: 123,
    #       gpa: 3.87,
    #       school_id: 8
    #     )
    #     it { should validate_uniqueness_of :name } 
    #   end
    # end

    it 'has a student_number lower bound' do
      should validate_numericality_of(:student_number).
      is_greater_than_or_equal_to(0)
    end

    it 'as a student_number higer bound' do
      should validate_numericality_of(:student_number).
      is_less_than_or_equal_to(10000)
    end

    it 'has a gpa lower bound' do
      should validate_numericality_of(:gpa).
      is_greater_than_or_equal_to(0)
    end

    it 'has a gpa higer bound' do
      should validate_numericality_of(:gpa).
      is_less_than_or_equal_to(4.0)
    end

    describe "uniqueness" do
      before(:each) do
            @student = Student.create(
              name: 'jill',
              student_number: 123,
              gpa: 3.87,
              school_id: 8
            )
      end
      
      it { should validate_uniqueness_of :name } 
      # @school = School.create(name: 'foo', address: '123', principal: 'mt', capacity: 15)
      
      # Student.create!(name: 'foo', student_number: '123', gpa: 3.4, school_id: 1) 
      # subject { Student.new(name: 'foo', student_number: '123', gpa: 3.4, school_id: 1) }
      # it { should validate_uniqueness_of(:name) }
    end

  end

end 