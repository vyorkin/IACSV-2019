int: n;

array[0..n] of var 0..3: xs;

constraint xs[0] = 0;
constraint xs[n] = 3;

constraint forall (j,i in 1..n where j = i + 1) (xs[i] + xs[j] <= 3);
constraint forall ([xs[i] >= 2 | i in 1..n where i mod 3 = 0]);

solve maximize sum(xs);
