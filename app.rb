require 'terminal-table'

class PrimeMultiplicationTable
  attr_reader :primes
  
  def initialize(amount_of_primes = 10)
    @primes = []
    generate_primes(amount_of_primes)
  end
  
  # Generate prime array to primes instance variable
  def generate_primes(amount_of_primes)
    (2..Float::INFINITY).each do |number|
      @primes << number if is_prime?(number)
      return if amount_of_primes == @primes.count
    end
  end
  
  # Determine if number is prime
  def is_prime?(number)
    Math.sqrt(number).floor.downto(2).each {|n| return false if number % n == 0}
    return true
  end
  
  # Generate multi-dimensional array of primes and products of primes
  def generate_multiplication_table
    rows = []
    rows << ([nil] + [@primes]).flatten
    @primes.each do |prime|
      multiplied_primes = @primes.map {|p| prime * p}
      rows << [prime] + multiplied_primes
    end
    return rows
  end
  
  # Use terminal table gem to print multi-dimensional array
  def print_table
    table = Terminal::Table.new(rows: generate_multiplication_table)
    puts table
  end
  
end