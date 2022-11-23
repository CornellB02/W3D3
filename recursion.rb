def range(min, max)
    return [min] if min == max - 1

    range(min, max - 1) << (max - 1)
end
p range(1, 5)


# def exp(b, n)
#     return 1 if n == 0

#     b * exp(b, n - 1)
# end

def exp(b, n)
    return 1 if n == 0
    return b if n == 1

    n.even? ? exp(b, n / 2) ** 2 : b * (exp(b, (n - 1) / 2) ** 2)
end
p exp(1, 0)
p exp(1, 1)
p exp(1, 2)
p exp(2, 0)
p exp(2, 1)
p exp(2, 2)
p exp(2, 3)
p exp(2, 4)
p exp(2, 5)


class Array 

    def deep_dup
        return self if is_a?(Array) == false

        temp = []
        self.each do |ele|
            if ele.is_a?(Array)
                temp << ele.deep_dup
            else 
                temp << ele
            end
        end
        temp
    end

    nums = [1, [2], [3, [4]]]
    p nums_copy = nums.deep_dup    

    nums_copy[1] << 1
    p nums
    p nums_copy
end


def fib(n)
    return [] if n == 0
    return [1] if n == 1
    return [1, 1] if n == 2
    fib_arr = fib(n-1)

    fib_arr << fib_arr[-1] + fib_arr[-2]
end
p fib(14)
p fib(8)

def iter_fib(n)
    return [] if n == 0
    return [1] if n == 1
    fib_arr = [1, 1]
    return fib_arr if n == 2
    
    while fib_arr.length < n
        fib_arr << fib_arr[-1] + fib_arr[-2]
    end
    fib_arr
end
p iter_fib(14)
p iter_fib(8)

def bsearch(array, target)
    return nil if array.length == 1 && array[0] != target

    mid = array.length / 2
    left = array[0...mid]
    right = array[mid..-1]

    if target < array[mid]
        bsearch(left, target)
    elsif target > array[mid]
        if bsearch(right, target) != nil
            mid + bsearch(right, target)
        else
            nil
        end
    else
        return mid
    end
end
p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge(array)
    return array if array.length == 1

    res_array = []

    mid = array.length / 2
    left = merge(array[0...mid])
    right = merge(array[mid..-1])

    while left.length > 0 || right.length > 0
        if left[0] < right[0]
            res_array << left.shift
        elsif left[0] > right[0]
           res_array << right.shift
        elsif left.length == 0 
            res_array << right.shift
        else 
            res_array << left.shift
        end
    end
    res_array
end


p merge([5,2,7,3,1,9])