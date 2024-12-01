from sympy import symbols, Matrix, sqrt, Function, pprint, trace

t = symbols("t")
p_1 = symbols("p_1", cls=Function)(t)
p_2 = symbols("p_2", cls=Function)(t)

identity = Matrix(
    [
        [1, 0],
        [0, 1],
    ]
)

sigma_x = Matrix(
    [
        [0, 1],
        [1, 0],
    ]
)

sigma_y = Matrix(
    [
        [0, -1j],
        [1j, 0],
    ]
)

sigma_z = Matrix(
    [
        [1, 0],
        [0, -1],
    ]
)


def channel(rho, p_1, p_2):
    return Matrix(
        [
            [
                (1 - p_1) * rho[0, 0] + p_2 * rho[1, 1],
                sqrt(1 - p_2) * sqrt(1 - p_1) * rho[0, 1],
            ],
            [
                sqrt(1 - p_2) * sqrt(1 - p_1) * rho[1, 0],
                (1 - p_2) * rho[1, 1] + p_1 * rho[0, 0],
            ],
        ]
    )


def typst_print(matrix, dim=2):
    def write(val):
        print(val, end="")

    write("mat(")
    for i, el in enumerate(matrix):
        write(el)
        if i == len(matrix) - 1:
            pass
        elif i == dim - 1:
            write(";")
        else:
            write(",")
    write(")")


bases = [identity, sigma_x, sigma_y, sigma_z]

F_matrix = [[], [], [], []]
for i, b1 in enumerate(bases):
    for j, b2 in enumerate(bases):
        # print()
        Fij_wala_matrix = b1 * channel(b2, p_1, p_2)
        # print(f"F{i}{j} = ", end="")
        # typst_print(Fij_wala_matrix)
        F_matrix[i].append(trace(Fij_wala_matrix) / 2)

F_matrix = Matrix(F_matrix)
print("\n\nF_matrix: ")

F_dot = F_matrix.diff(t)
F_dot.simplify()
F_inv = F_matrix.inv()
F_inv.simplify()

print("\n\nF_dot: ")
pprint(F_dot)
print("\n\nF_inv: ")
pprint(F_inv)

L_matrix = F_dot * F_inv
L_matrix.simplify()

print("\n\nL_matrix: ")
pprint(L_matrix)
