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