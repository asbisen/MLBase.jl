# Testing of basic calculation

using MLBase
using Base.Test

# test of inplace vector calculation

a = rand(5)
b = rand(5)
v = 0.5

ac = copy(a)
@test add!(ac, b) === ac
@test ac == a + b

ac = copy(a)
@test add!(ac, v) === ac
@test ac == a + v

ac = copy(a)
@test sub!(ac, b) === ac
@test ac == a - b

ac = copy(a)
@test sub!(ac, v) === ac
@test ac == a - v

ac = copy(a)
@test mul!(ac, b) === ac
@test ac == a .* b

ac = copy(a)
@test mul!(ac, v) === ac
@test ac == a * v

# test of calculation with columns/rows

a = rand(3, 5)
c = rand(3)
r = rand(5)

ac = copy(a)
@test add_cols!(ac, c) === ac
@test ac == add_cols(a, c) == bsxfun(+, a, c)

ac = copy(a)
@test add_rows!(ac, r) === ac
@test ac == add_rows(a, r) == bsxfun(+, a, reshape(r, 1, 5))

ac = copy(a)
@test sub_cols!(ac, c) === ac
@test ac == sub_cols(a, c) == bsxfun(-, a, c)

ac = copy(a)
@test sub_rows!(ac, r) === ac
@test ac == sub_rows(a, r) == bsxfun(-, a, reshape(r, 1, 5))

ac = copy(a)
@test mul_cols!(ac, c) === ac
@test ac == mul_cols(a, c) == bsxfun(.*, a, c)

ac = copy(a)
@test mul_rows!(ac, r) === ac
@test ac == mul_rows(a, r) == bsxfun(.*, a, reshape(r, 1, 5))

# test add_diag

a = rand(3, 3)
v = rand(3)

@test add_diag(a, 2.) == a + eye(3) * 2.
@test add_diag(a, v) == a + diagm(v)
@test add_diag(a, v, 2.) == a + diagm(v) * 2.


