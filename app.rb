require 'terminal-table'

class PrimeMultiplicationTable
  attr_reader :primes
  
  def initialize(amount_of_primes = 10)
    @primes = []
    
    (2..Float::INFINITY).each do |number|
      @primes << number if is_prime?(number)
      return if amount_of_primes == @primes.count
    end
  end
  
  def is_prime?(number)
    Math.sqrt(number).floor.downto(2).each {|n| return false if number % n == 0}
    return true
  end
  
  def generate_multiplication_table
    rows = []
    rows << ([nil] + [@primes]).flatten
    @primes.each do |prime|
      multiplied_primes = @primes.map {|p| prime * p}
      rows << [prime] + multiplied_primes
    end
    return rows
  end
  
  def print_table
    table = Terminal::Table.new(rows: generate_multiplication_table)
    puts table
  end
  
end