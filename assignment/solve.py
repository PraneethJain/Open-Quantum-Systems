from sympy import symbols, Matrix, sqrt, Function, pprint

t = symbols('t')
p = symbols('p', cls=Function)(t)

F = Matrix([
    [1, 0, 0, 0],
    [0, sqrt(1-p), 0, 0],
    [0, 0, sqrt(1-p), 0],
    [p, 0, 0, 1-p],
])

F_inv = F.inv()
F_dot = F.diff(t)

print("F inverse")
pprint(F_inv)
print("\n\nF dot")
pprint(F_dot)

print("\n\nL matrix")
pprint(F_dot * F_inv)