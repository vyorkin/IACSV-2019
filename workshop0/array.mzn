int: n;

array[1..n] of var 0..9: xs;
constraint sum(xs) = product(xs);

constraint forall (j,i in 1..n where j = i + 1) (xs[i] <= xs[j]);

solve satisfy;
