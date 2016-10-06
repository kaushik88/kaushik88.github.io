### MIT Problems

1. Integer Knapsack Problem

	Size and Value = (s_i, v_i) for i= 1 to n.
	Capacity = C.
	M(j) = max { M(j-1), max {M(j-s(i)) + v(i)}} ; j=1 to C and i = 1 to n.

2. Max Value Contiguous Subsequence

	A[i] i = 1 to n.
	M[j] = max { M[j-1] + A[j], A[j]}

3. Making Change Problem
	
	Coins = v[i]
	M[j] = min_i { M[j] - v[i]} + 1

4. Longest Increasing Subsequence

	A[i]
	L[j] = max_i{L[i]} + 1; i<j and A[i] < A[j]

5. Box Stacking
	
	N Boxes (h_i, w_i and d_i)
	H[j] = max_i{H[i] + h_j} ; i<j and w_i > w_j and d_i > d_j.

6. Building Bridges

	Same as Longest Increasing Subsequence.
	X[i] = index in northern bridge for city in position i in southern bridge.

7. Integer Knapsack (No Duplicates)
	Size and Value = (s_i, v_i) for i = 1 to n.
	Capacity = C.
	M[i][j] = max {M[i-1][j], M[i-1][j-s_i] + v_i}

8. Balanced Partition 
	P[i][j] = {1; if some some subset of {A(i)...A(j)}} has a sum of j;0 other wise}.
	P[i][j] = max {P[i-1][j], P[i-1][j-A[i]]}

9. Edit Distance
	T[i][j] = Min Cost to transform A[1..i] to B[1..j]
	T[i][j] = min {
				C_d + T[i-1][j]
				C_i + T[i][j-1]
				T[i-1][j-1] if A[i] == B[j]
				C_r + T[i-1][j-1] if A[i] != B[j] 
			}

10. Boolean Paranthesis

	T[i][j] = number of ways to paranthesize symbols i..j such that this subexpression evaluates to true.
	T[i][j] = Sum_k (k>=i and <= j-1) {

			T[i][k].T[k+1][j] (and)
			Total[i][k] Total[k+1][j] - F[i][k]F[k+1][j]
			T[i][k]F[k+1][j] + F[i][k]T[k+1][j]
	}

11. Optimal Strategy for a game

	V[i][j] = guaranteed money using coins from i to j.
	V[i][j] = max {
			min{
					V(i-2)(j)
					V(i-1)(j-1)
				}
			min {
					V(i-1)(j-1)
					V(i)(j-2)
				}	
			}

12. Longest Common Subsequence
	X[i] and Y[j]
	L[i][j] = {
		L[i-1][j-1] + 1 ; if X[i] == Y[j]
		max (L[i-1][j], L[i][j-1]) ; if X[i] != Y[j]
	}

13. Min Cost Path
	Cost Matrix C[i][j]

	MCP[i][j] = min {
		MCP[i-1][j]
		MCP[i][j-1]
		MCP[i-1][j-1]
		} + C[i][j]

14. Number of Coin Changes
	N value ; j = 1 to N.
	m coins ; i = 1 to m.

	M[i][j] = M[i-1][j] + M[i][j-1]

15. Matrix Chain Multiplication
	O(N^3)

	for (L = 2 to N) {
		for (i=1 to N-L+1) {
			j = i + L -1
			for (k=i to j-1) {

			}
		}
	}

16. Binomial Coefficient

	C(n, k) = C(n-1, k-1) + C(n-1, k)
   	C(n, 0) = C(n, n) = 1

17. Egg Drop Problem
		
	k ==> Number of floors
  	n ==> Number of Eggs
  	eggDrop(n, k) ==> Minimum number of trails needed to find the critical floor in worst case.
  	eggDrop(n, k) = 1 + min{max(eggDrop(n - 1, x - 1), eggDrop(n, k - x)): x in {1, 2, ..., k}}.

18. Palindromic Subsequence

	// Every single character is a palindrom of length 1
	L(i, i) = 1 for all indexes i in given sequence

	// IF first and last characters are not same
	If (X[i] != X[j])  L(i, j) =  max{L(i + 1, j),L(i, j - 1)}

	// If there are only 2 characters and both are same
	Else if (j == i + 1) L(i, j) = 2

	// If there are more than two characters, and first and last characters are same
	Else L(i, j) =  L(i + 1, j - 1) + 2

19. Cut Rod

	cutRod(n) = max(price[i] + cutRod(n-i-1)) for all i in {0, 1 .. n-1}

20. Digit Sum
	finalCount(n, sum) = ∑finalCount(n-1, sum-x)