# that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

# For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

# Given A = [1, 2, 3], the function should return 4.

# Given A = [−1, −3], the function should return 1.

# Write an efficient algorithm for the following assumptions:

# N is an integer within the range [1..100,000];
# each element of array A is an integer within the range [−1,000,000..1,000,000].

def solution(a)
    #Trato a lista para ter elementos unicos, não negativos 
    # e ordenados do menor para maior para facilitar percorrer e filtrando números maiores 1000000
    lista_tratada = a.uniq
                     .sort! { |a, b| a <=> b }
                     .select { |n| n > 0 && n <= 1000000 }

    #Se o retorno da instrução acima foi um array vazio, 
    # significa que eram apenas números negativos, assim retorna 1
    return 1 if lista_tratada.empty?
    
    #Considerando que N só tem positivos limitados a 100000
    tamanho_lista = lista_tratada.size
    if lista_tratada.size > 10000
        tamanho_lista = 10000
    end

    #Percorre a lista tratada se baseando no range de 1 
    # até o tamanho do array passado
    for num in 1..tamanho_lista || 100000
        #Checa a existência do número na lista tratada, caso não exista esse é o retorno do menor 
        # número não negativo que não ocorre na lista
        return num if !lista_tratada.include?(num)
    end

    #Caso tenha chegado até aqui, significa que todos os números percorridos 
    # na lista estavam presentes, assim a não ocorrencia passar a ser do próximo número depois do "max"
    lista_tratada.max + 1
end

puts solution([1, 3, 6, 4, 1, 2])
puts solution([1, 2, 3])
puts solution([-1, -3])