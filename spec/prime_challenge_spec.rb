require 'rspec'
require_relative '../app.rb'

RSpec.describe PrimeMultiplicationTable do
  before do
    @object = PrimeMultiplicationTable.new
  end
  
  it "creates an object with 10 primes" do
    expect(@object.primes.count).to eq(10)
  end
  
  it "checks numbers for primality" do
    expect(@object.is_prime?(1300997)).to eq(true)
    expect(@object.is_prime?(1300990)).to eq(false)
  end
  
  it "generates a multiplication table for a simple run" do
    @object = PrimeMultiplicationTable.new(2)
    expect(@object.generate_multiplication_table).to eq([[nil, 2, 3], [2, 4, 6], [3, 6, 9]])
  end
  
end
