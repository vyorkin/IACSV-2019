var 0..10: x;

var 0..10: i;

% constraint x mod 4 = 0;
constraint x = 4 * i;

solve minimize (x - 7) ^ 2;
