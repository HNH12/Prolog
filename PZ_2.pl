%Макс двух чисел;
max2(X,Y):-max(X,Y,Z),write(Z).
max(X,Y,Y):-Y>X,!.
max(X,_,X).

%Макс трёх чисел;
max3(X,Y,Z):-max(X,Y,Z,C),write(C).
max(X,Y,Z,X):-X>Y,X>Z,!.
max(_,Y,Z,Y):-Y>Z,!.
max(_,_,Z,Z).

%Факториал;
fact(X):-fact(X,C),write(C).
fact(0,1):-!.
fact(X,N):-X1 is X-1,fact(X1,N1),N is N1*X.

%Число Фибоначи;
fib(X):-fib(X,C),write(C).
fib(0,0):-!.
fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1,N2 is N-2,fib(N1,X1),fib(N2,X2),X is X1+X2.

%Проверка на простоту;
pr(2):-!.
pr(X):-pr_l(2,X).
pr_l(X,X):-!.
pr_l(A,X):-R is X mod A,R=0,!,fail.
pr_l(A,X):-A1 is A+1,pr_l(A1,X).

%Последовательность;
posled:-posled(13,13,C,0,N),write("Номер: "),write(C),nl,
    write("Длина цепочки: "),write(N).

posled(1000000,C,C,N,N):-!.
posled(X,_,C,K,N):-chains(X,0,K1),K1>K,X1 is X+1,posled(X1,X,C,K1,N),!.
posled(X,D,C,K,N):-X1 is X+1,posled(X1,D,C,K,N).

chains(1,K,K):-!.
chains(X,K,N):-R is X mod 2,R=0,X1 is X/2,K1 is K+1,chains(X1,K1,N),!.
chains(X,K,N):-X1 is X*3+1,K1 is K+1,chains(X1,K1,N).

%Сумма цифр числа;
sc(X):-sc(X,C),write(C).
sc(X,X):-X<10,!.
sc(X,S):-R is X mod 10, X1 is X div 10,sc(X1,S1),S is S1+R.

%Наибольший простой делитель числа;
npd(X):-npd(X,X,0,C),(C\=0->write(C);write("Not Found")).
npd(_,1,C,C):-!.
npd(X,E,_,C):-pr(E),R is X mod E,R=0,npd(X,1,E,C),!.
npd(X,E,D,C):-E1 is E-1,npd(X,E1,D,C).

%НОД;
nod(X,Y):-nod(X,Y,C),write(C).
nod(X,Y,C):-R is X mod Y,R=0,C is Y,!.
nod(X,Y,C):-R is X mod Y,nod(Y,R,C).

%Функция Эйлера (в задании ошибка: фукнция эйлера от одного числа);
eiler(X):-Y is X-1,eiler(X,Y,0,K),write(K).
eiler(_,0,K,K):-!.
eiler(X,Y,N,K):-nod(X,Y,C),C=1,Y1 is Y-1,N1 is N+1,eiler(X,Y1,N1,K),!.
eiler(X,Y,N,K):-Y1 is Y-1,eiler(X,Y1,N,K).






