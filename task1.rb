# that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

# For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

# Given A = [1, 2, 3], the function should return 4.

# Given A = [−1, −3], the function should return 1.

# Write an efficient algorithm for the following assumptions:

# N is an integer within the range [1..100,000];
# each element of array A is an integer within the range [−1,000,000..1,000,000].

def solution(a)
    lista_tratada = a.uniq.sort! { |a, b| a <=> b }.select { |n| n > 0 }

    return 1 if lista_tratada.empty?

    maior_valor = lista_tratada.max
    
    for num in 1..lista_tratada.size
        return num if !lista_tratada.include?(num)
    end

    maior_valor + 1
end

puts solution([1, 3, 6, 4, 1, 2])
puts solution([1, 2, 3])
puts solution([-1, -3])