array[int] of int: readings;
int: start;
int: n = length(readings);

set of int: HOUR = 1..n;
set of int: HOUR0 = 0..n;

enum CHOICE = {heat, strongly_heat, cool, strongly_cool, do_nothing};

array[CHOICE] of int: costs = [1, 5, 3, 9, 0];
array[CHOICE] of int: deltas = [1, 4, -2, -5, 0];

predicate in_range(var int: t) = 25 <= t /\ t <= 30;

array[HOUR] of var CHOICE: choice;
array[HOUR] of var int: expenses;

array[HOUR0] of var int: temp;
constraint temp[0] = start;

constraint forall(h in HOUR)
  (expenses[h] = costs[choice[h]] /\
   temp[h] = (temp[h-1] + readings[h]) div 2 + deltas[choice[h]]);

constraint forall (h in HOUR)
  (in_range(temp[h]));

solve minimize sum(expenses);

output ["choice = ", show(choice), "\n",
        "temp = ", show(temp), "\n",
        "cost = ", show(sum(expenses)), "\n"];
