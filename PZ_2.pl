%Макс двух чисел;
max(X,Y,Y):-Y>X,!.
max(X,_,X).

%Макс трёх чисел;
max(X,Y,Z,X):-X>Y,X>Z,!.
max(_,Y,Z,Y):-Y>Z,!.
max(_,_,Z,Z).

%Факториал;
fact(0,1):-!.
fact(X,N):-X1 is X-1,fact(X1,N1),N is N1*X.

%Число Фибоначи;
fib(0,0):-!.
fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1,N2 is N-2,fib(N1,X1),fib(N2,X2),X is X1+X2.

%Проверка на простоту;
pr(2):-!.
pr(X):-pr_1(2,X).
pr_1(X,X):-!.
pr_l(A,X):-R is X mod A,R=0,!,fail.
pr_l(A,X):-A1 is A+1,pr_l(A1,X).

%Последовательность;
p(X):-X=<5,posled(X),X1 is X+1,p(X1),!.
posled(1):-write(1),!.
posled(X):-R is X mod 2,R=0,write(X),write(" "),X1 is X/2,posled(X1).
posled(X):-write(X),write(" "),X1 is 3*X+1,posled(X1).

%Сумма цифр числа;
sc(X,X):-X<10,!.
sc(X,S):-R is X mod 10, X1 is X div 10,sc(X1,S1),S is S1+R.










