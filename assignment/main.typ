#set text(font: "Roboto")
#show link: set text(rgb(0, 0, 255))

#let ket(x) = $lr(|#x angle.r)$
#let bra(x) = $lr(angle.l #x |)$
#let braket(x, y) = $lr(angle.l #x|#y angle.r)$
#let tensor = $times.circle$

#set page(
  header: [Moida Praneeth Jain #h(1fr) 2022101093 #line(start: (-10%, 0%), end: (110%, 0%))], footer: [#line(start: (-10%, 0%), end: (110%, 0%))
    Open Quantum Systems and Quantum Thermodynamics
    #h(1fr)
    #counter(page).display("1 of 1", both: true)
    ], margin: (x: 1.5cm),
)

= Open Quantum Systems and Quantum Thermodynamics Assignment
== Question 1
=== Part (a)

The quantum depolarising channel is defined as
$ Delta_lambda (rho) = (1 - lambda) rho + lambda/d tr(rho) I " with the constraint " 0 <= lambda <= 1 + 1/(d^2 - 1)  $

To find its fixed point, we have
$ Delta_lambda (rho) = rho $
$ (1 - lambda) rho + lambda/d tr(rho)I = rho $
$ rho - rho lambda + lambda/d I = rho $
$ rho lambda = lambda/d I $
$ rho = I/d $
$therefore I/d$ is the fixed point for the quantum depolarising channel.

=== Part (b)
For the case of qubits, we have $d=2$, and thus
$ Delta_lambda (rho) = (1 - lambda)rho + lambda/2 tr(rho)  I "with the constraint" 0 <= lambda <= 4/3 $

First, we find the Choi state for this map

$ I tensor Delta_lambda (ket(psi)bra(psi)) $
where $ket(psi)$ is the maximally entangled state
$ ket(psi) = 1/sqrt(2)(ket(00) + ket(11)) $

We have

$ I tensor Delta_lambda (1/2 (ket(00) + ket(11))(bra(00) + bra(11))) $

$ = 1/2 I tensor Delta_lambda (ket(00)bra(00) + ket(00)bra(11) + ket(11)bra(00) + ket(11)bra(11)) $

$ = 1/2 I tensor Delta_lambda (ket(0)bra(0) tensor ket(0)bra(0) + ket(0)bra(1) tensor ket(0)bra(1) + ket(1)bra(0) tensor ket(1)bra(0) + ket(1)bra(1) tensor ket(1)bra(1)) $

Since $(a tensor b)(c tensor d) = a c tensor b d $, we get

$ = 1/2 (ket(0)bra(0) tensor Delta_lambda (ket(0)bra(0)) + ket(0)bra(1) tensor Delta_lambda (ket(0)bra(1)) + ket(1)bra(0) tensor Delta_lambda (ket(1)bra(0)) + ket(1)bra(1) tensor Delta_lambda (ket(1)bra(1)))  $

$ = 1/2 (ket(0)bra(0)tensor((1-lambda)ket(0)bra(0) + lambda/2 * 1 * I) + ket(0)bra(1)tensor((1-lambda)ket(0)bra(1) + lambda/2 * 0 * I) \ + ket(1)bra(0)tensor((1-lambda)ket(1)bra(0) + lambda/2 * 0 * I) +ket(1)bra(1)tensor((1-lambda)ket(1)bra(1) + lambda/2 * 1 * I)) $

$ = 1/2 (ket(0)bra(0)tensor((1-lambda)ket(0)bra(0) + lambda/2 I) + (1-lambda)ket(0)bra(1) tensor ket(0)bra(1) \ + (1-lambda) ket(1)bra(0) tensor ket(1)bra(0) +ket(1)bra(1)tensor((1-lambda)ket(1)bra(1) + lambda/2 I)) $

$ = 1/2 ((1-lambda)ket(0)bra(0) tensor ket(0)bra(0) + lambda/2 ket(0)bra(0) tensor (ket(0)bra(0) + ket(1)bra(1)) + (1-lambda)ket(0)bra(1) tensor ket(0)bra(1)\ + (1-lambda)ket(1)bra(0) tensor ket(1)bra(0) + (1-lambda)ket(1)bra(1) tensor ket(1)bra(1) + lambda/2 ket(1)bra(1) tensor (ket(0)bra(0) + ket(1)bra(1))) $

$ = 1/2 ((1-lambda)ket(00)bra(00) + lambda/2 (ket(00)bra(00) + ket(01)bra(01)) + (1-lambda)ket(00)bra(11) \ + (1-lambda)ket(11)bra(00) + (1-lambda)ket(11)bra(11) + lambda/2 (ket(10)bra(10) + ket(11)bra(11))) $

// $ = (1/2 - lambda/4)ket(00)bra(00) + lambda/4 ket(01)bra(01) + (1/2 - lambda/2)ket(00)bra(11)  \ + (1/2 - lambda/2)ket(11)bra(00) +  (1/2 - lambda/4)ket(11)bra(11) + lambda/4 ket(10)bra(10) $

$ = (1/2 - lambda/4)(ket(00)bra(00) + ket(11)bra(11)) + (1/2 - lambda/2)(ket(00)bra(11) + ket(11)bra(00)) + lambda/4 (ket(01)bra(01) + ket(10)bra(10)) $
Thus, we get the Choi state

$ C_d = mat(
  1/2-lambda/4,0,0,1/2-lambda/2;
  0,lambda/4,0,0;
  0,0,lambda/4,0;
  1/2-lambda/2,0,0,1/2-lambda/4;
) $

On diagonalizing $C_d$, we get
$ C_d = Sigma_(i=0)^3 lambda_i ket(alpha_i)bra(alpha_i) $
where
$ lambda_0 = 1/4 (4-3lambda), lambda_1 = lambda_2 = lambda_3 = lambda/4 $
and
$ alpha_0 = mat(1;0;0;1),alpha_1 = mat(0;1;0;0),alpha_2 = mat(0;0;1;0),alpha_3 = mat(-1;0;0;1) $
Now, we construct $A_i$ from the $alpha_i$
$ A_0 = mat(1,0;0,1), A_1 = mat(0,0;1,0), A_2 = mat(0,1;0,0), A_3 = mat(-1,0;0,1) $

So, we get a set of Kraus operators $K_i = sqrt(lambda_i)A_i$
$ K_0 = (sqrt(1 - 3/4 lambda)) I, K_1 = sqrt(lambda/4) mat(0,0;1,0), K_2 = sqrt(lambda/4) mat(0,1;0,0), K_3 = sqrt(lambda/4) mat(-1,0;0,1) $

Note that the Kraus representation for a map is not unique. We can construct the canonical Kraus operators, which are

$ K_0 = (sqrt(1 - 3/4 lambda)) I, K_1 = sqrt(lambda/4) sigma_x, K_2 = sqrt(lambda/4) sigma_y, K_3 = sqrt(lambda/4) sigma_z $

=== Part (c)

We have
$ (d rho)/(d t) = - i [H, rho] + sum_k gamma_k (L_k rho L_k^dagger - 1/2 {L_k^dagger L_k, rho}) $

Since the depolarising channel is purely dissipative, we have $H$ = 0

The parameter $lambda$ is interpreted as $lambda = gamma Delta t$

Thus, we get the Lindblad operators

$ L_1 = sqrt(gamma)sigma_x, L_2 = sqrt(gamma)sigma_y, L_3 = sqrt(gamma)sigma_Z $
and
$ (d rho)/(d t) = sum_(k=1)^3 gamma_k (sigma_k rho sigma_k - rho) $
is the required Lindblad type master equation

== Question 2

$ rho_11 (t) = rho_11 (0)e^(-gamma t) $
$ rho_12 (t) = rho_12 (0)e^(-2gamma t) $
Since $rho$ is hermitian, we have $rho_21 = rho_12^*$, and assuming $gamma$ is real
$ rho_21 (t) = rho_12 (0)^* e^(-2gamma t) $
Since $tr(rho) = 1$, $rho_22 = 1 - rho_11$
$ rho_22 (t) = 1 - rho_11 (0) e^(-gamma t) $

Thus, we have
$ rho(t) = phi.alt(rho(0)) = mat(rho_11 (0)e^(-gamma t), rho_12 (0)e^(-2gamma t);
               rho_12 (0)^* e^(-2gamma t), 1 - rho_11 (0) e^(-gamma t)) $


We now find the $F$-matrix, defined by $F_(i j) = tr(G_i phi.alt(G_j))$, where ${G_i}$ is the matrix basis ${II/sqrt(2), sigma_x/sqrt(2), sigma_y/sqrt(2), sigma_z/sqrt(2)}$

$ F_00 = 1/2 tr(I phi.alt(I)) = 1/2 tr(phi.alt(I)) = 1/2 tr(mat(e^(-gamma t),0;0,1 - e^(-gamma t))) = 1/2 $
$ F_01 = 1/2 tr(I phi.alt(sigma_x)) = 1/2 tr(phi.alt(sigma_x)) = 1/2 tr(mat(0,  e^(-2 gamma t); e^(-2 gamma t), 1)) = 1/2 $
$ F_02 = 1/2 tr(I phi.alt(sigma_y)) = 1/2 tr(phi.alt(sigma_y)) = 1/2 tr(mat(0,  -i e^(-2 gamma t); i e^(-2 gamma t), 1)) = 1/2 $
$ F_03 = 1/2 tr(I phi.alt(sigma_z)) = 1/2 tr(phi.alt(sigma_z)) = 1/2 tr(mat(e^(-gamma t),  0; 0, 1 - e^(- gamma t))) = 1/2 $
$ F_10 = 1/2 tr(sigma_x phi.alt(I)) = 1/2 tr(mat(0, 1; 1, 0) mat(e^(-gamma t),  0; 0, 1 - e^(- gamma t))) = 1/2 tr(mat(0, 1 - e^(-gamma t); e^(-gamma t), 0)) = 0 $
$ F_11 = 1/2 tr(sigma_x phi.alt(sigma_x)) = 1/2 tr(mat(0, 1; 1, 0) mat(0,  e^(-2 gamma t); e^(-2 gamma t), 1)) = 1/2 tr(mat(e^(-2 gamma t), 1; 0, e^(-2 gamma t))) = e^(-2 gamma t) $
$ F_12 = 1/2 tr(sigma_x phi.alt(sigma_y)) = 1/2 tr(mat(0, 1; 1, 0) mat(0,  -i e^(-2 gamma t); i e^(-2 gamma t), 1)) = 1/2 tr(mat(i e ^(-2 gamma t), 1; 0, -i e^(-2 gamma t))) = 0 $
$ F_13 = 1/2 tr(sigma_x phi.alt(sigma_z)) = 1/2 tr(mat(0, 1; 1, 0) mat(e^(-gamma t),  0; 0, 1 - e^(- gamma t))) = 1/2 tr(mat(0, 1 - e^(-gamma t); e^(-gamma t), 0)) = 0 $
$ F_20 = 1/2 tr(sigma_y phi.alt(I)) = 1/2 tr(mat(0, -i; i, 0) mat(e^(-gamma t),  0; 0, 1 - e^(- gamma t))) = 1/2 tr(mat(0, -i + i e^(-gamma t); i e^(-gamma t), 0)) = 0 $
$ F_21 = 1/2 tr(sigma_y phi.alt(sigma_x)) = 1/2 tr(mat(0, -i; i, 0) mat(0,  e^(-2 gamma t); e^(-2 gamma t), 1)) = 1/2 tr(mat(-i e^(-2 gamma t), -i; 0, i e^(-2 gamma t))) = 0 $
$ F_22 = 1/2 tr(sigma_y phi.alt(sigma_y)) = 1/2 tr(mat(0, -i; i, 0) mat(0,  -i e^(-2 gamma t); i e^(-2 gamma t), 1)) = 1/2 tr(mat(e^(-2 gamma t), -i; 0, e^(-2 gamma t))) = e^(-2 gamma t) $
$ F_23 = 1/2 tr(sigma_y phi.alt(sigma_z)) = 1/2 tr(mat(0, -i; i, 0) mat(e^(-gamma t),  0; 0, 1 - e^(- gamma t))) = 1/2 tr(mat(0, -i + i e^(-gamma t); i e^(-gamma t), 0)) = 0 $
$ F_30 = 1/2 tr(sigma_z phi.alt(I)) = 1/2 tr(mat(1, 0; 0, -1) mat(e^(-gamma t),  0; 0, 1 - e^(- gamma t))) = 1/2 tr(mat(e^(-gamma t), 0; 0, -1 + e^(-gamma t))) = e^(-gamma t) - 1/2 $
$ F_31 = 1/2 tr(sigma_z phi.alt(sigma_x)) = 1/2 tr(mat(1, 0; 0, -1) mat(0,  e^(-2 gamma t); e^(-2 gamma t), 1)) = 1/2 tr(mat(0, e^(-2 gamma t); -e^(-2 gamma t), -1)) = -1/2 $
$ F_32 = 1/2 tr(sigma_z phi.alt(sigma_y)) = 1/2 tr(mat(1, 0; 0, -1) mat(0,  -i e^(-2 gamma t); i e^(-2 gamma t), 1)) = 1/2 tr(mat(0, -i e^(-2 gamma t); -i e^(-2 gamma t), -1)) = -1/2 $
$ F_33 = 1/2 tr(sigma_z phi.alt(sigma_z)) = 1/2 tr(mat(1, 0; 0, -1) mat(e^(-gamma t),  0; 0, 1 - e^(- gamma t))) = 1/2 tr(mat(e^(-gamma t), 0; 0, -1 + e^(-gamma t))) = e^(-gamma t) -1/2 $

$ F = mat(1/2, 1/2, 1/2, 1/2; 0, e^(-2 gamma t), 0, 0; 0, 0, e^(-2 gamma t), 0; e^(- gamma t) - 1/2, -1/2, -1/2, e^(-gamma t) - 1/2) $

Clearly, the matrix is not full rank, and thus its determinant is $0$.

Thus, the $F$ matrix corresponding to this map is *not* invertible.

Also, since this operation cannot be represented by a single unitary, it is also *not* reversible.

== Question 3

The generalised amplitude damping channel for a qubit is defined as
$ Lambda(mat(rho_00, rho_01; rho_10, rho_11)) = mat((1-p_1)rho_00 + p_2 rho_11, sqrt(1-p_2) sqrt(1-p_1) rho_01; sqrt(1-p_2) sqrt(1-p_1) rho_10, (1-p_2)rho_11 + p_1 rho_00) $

where $p_arrow.t$ represents qubit excitation probability, and $p_arrow.b$ represents qubit relaxation probability.


We now find the $F$-matrix, defined by $F_(i j) = tr(G_i phi.alt(G_j))$, where ${G_i}$ is the matrix basis ${II/sqrt(2), sigma_x/sqrt(2), sigma_y/sqrt(2), sigma_z/sqrt(2)}$

$ F_00 = 1/2 tr(I phi.alt(I)) = 1/2 tr(mat(-p_1 + p_2 + 1,0;0,p_1 - p_2 + 1)) = 1 $
$ F_01 = 1/2 tr(I phi.alt(sigma_x)) = 1/2 tr(mat(0,sqrt(1 - p_1)*sqrt(1 - p_2);sqrt(1 - p_1)*sqrt(1 - p_2),0)) = 0 $
$ F_02 = 1/2 tr(I phi.alt(sigma_y)) = 1/2 tr(mat(0,-i*sqrt(1 - p_1)*sqrt(1 - p_2);i * sqrt(1 - p_1)*sqrt(1 - p_2),0)) = 0 $
$ F_03 = 1/2 tr(I phi.alt(sigma_z)) = 1/2 tr(mat(-p_1 - p_2 + 1,0;0,p_1 + p_2 - 1)) = 0 $

$ F_10 = 1/2 tr(sigma_x phi.alt(I)) = 1/2 tr(mat(0,p_1 - p_2 + 1;-p_1 + p_2 + 1,0)) = 0 $
$ F_11 = 1/2 tr(sigma_x phi.alt(sigma_x)) = 1/2 tr(mat(sqrt(1 - p_1)*sqrt(1 - p_2),0;0,sqrt(1 - p_1)*sqrt(1 - p_2))) = sqrt(1-p_1) sqrt(1 - p_2) $
$ F_12 = 1/2 tr(sigma_x phi.alt(sigma_y)) = 1/2 tr(mat(i*sqrt(1 - p_1)*sqrt(1 - p_2),0;0,-i*sqrt(1 - p_1)*sqrt(1 - p_2))) = 0 $
$ F_13 = 1/2 tr(sigma_x phi.alt(sigma_z)) = 1/2 tr(mat(0,p_1 + p_2 - 1;-p_1 - p_2 + 1,0)) = 0 $

$ F_20 = 1/2 tr(sigma_y phi.alt(I)) = 1/2 tr(mat(0,-i*(p_1 - p_2 + 1);i*(-p_1 + p_2 + 1),0)) = 0 $
$ F_21 = 1/2 tr(sigma_y phi.alt(sigma_x)) = 1/2 tr(mat(-i*sqrt(1 - p_1)*sqrt(1 - p_2),0;0,i*sqrt(1 - p_1)*sqrt(1 - p_2))) = 0 $
$ F_22 = 1/2 tr(sigma_y phi.alt(sigma_y)) = 1/2 tr(mat(sqrt(1 - p_1)*sqrt(1 - p_2),0;0,sqrt(1 - p_1)*sqrt(1 - p_2))) = sqrt(1-p_1) sqrt(1-p_2) $
$ F_23 = 1/2 tr(sigma_y phi.alt(sigma_z)) = 1/2 tr(mat(0,-i*(p_1 + p_2 - 1);i*(-p_1 - p_2 + 1),0)) = 0 $

$ F_30 = 1/2 tr(sigma_z phi.alt(I)) = 1/2 tr(mat(-p_1 + p_2 + 1,0;0,-p_1 + p_2 - 1)) = p_2 - p_1 $
$ F_31 = 1/2 tr(sigma_z phi.alt(sigma_x)) = 1/2 tr(mat(0,sqrt(1 - p_1)*sqrt(1 - p_2);-sqrt(1 - p_1)*sqrt(1 - p_2),0)) = 0 $
$ F_32 = 1/2 tr(sigma_z phi.alt(sigma_y)) = 1/2 tr(mat(0,-i*sqrt(1 - p_1)*sqrt(1 - p_2);-i*sqrt(1 - p_1)*sqrt(1 - p_2),0)) = 0 $
$ F_33 = 1/2 tr(sigma_z phi.alt(sigma_z)) = 1/2 tr(mat(-p_1 - p_2 + 1,0;0,-p_1 - p_2 + 1)) = 1 - p_1 - p_2 $

$ F = mat(1, 0, 0, 0; 0, sqrt(1-p_1) sqrt(1-p_2), 0, 0; 0, 0, sqrt(1-p_1) sqrt(1-p_2), 0; p_2 - p_1, 0, 0, 1-p_1-p_2) $

Now, we know that $ L = dot(F) F^(-1) $

$ dot(F) = mat(0, 0, 0, 0; 0, (-(1-p_1)dot(p_2) - (1-p_2)dot(p_1))/(2 sqrt(1-p_1)sqrt(1-p_2)), 0, 0; 0, 0, (-(1-p_1)dot(p_2) - (1-p_2)dot(p_1))/(2 sqrt(1-p_1)sqrt(1-p_2)), 0; dot(p_2)-dot(p_1), 0, 0, -dot(p_1) - dot(p_2)) $

$ F^(-1) = mat(1, 0, 0, 0; 0, 1/(sqrt(1-p_1)sqrt(1-p_2)), 0, 0; 0, 0, 1/(sqrt(1-p_1)sqrt(1-p_2)), 0; (p_2-p_1)/(p_1+p_2-1), 0, 0, 1/(1-p_1-p_2)) $

$ L = mat(0, 0, 0, 0; 0, ((p_1-1)dot(p_2) + (p_2-1)dot(p_1))/(2(p_1-1)(p_2-1)), 0, 0; 0, 0, ((p_1-1)dot(p_2) + (p_2-1)dot(p_1))/(2(p_1-1)(p_2-1)), 0; (2 p_1 dot(p_2) - 2 p_2 dot(p_1) + dot(p_1) - dot(p_2))/(p_1 + p_2 - 1), 0, 0, (dot(p_1) + dot(p_2))/(p_1 + p_2 - 1)) $