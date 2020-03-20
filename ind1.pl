% ¬озведение числа в степень
pow(B,1,B):-!.
pow(B,D,Res):-D1 is D-1,pow(B,D1,Res1),Res is Res1*B.

% True - число есть результат возведени€ в степень
% одного из чисел, сто€щих за рассматриваемым,
% иначе берЄт следующее число (пока не дошЄл до границ);
check(_,C,_,_,_,C):-!,fail.
check(A,B,E,M,Z,C):-find(A,B,E,M,Z,C),!.
check(A,B,E,M,Z,C):-B1 is B+1,check(A,B1,E,M,Z,C),!.

% True - число в какой-то степени равн€етс€ рассматрвиаемом числу,
% иначе берЄт другую степень;
find(_,C,_,_,_,C):-!,fail.
find(A,B,_,M,_,_):-pow(B,M,A),!.
find(_,_,_,Z,Z,_):-!,fail.
find(A,B,E,M,Z,C):-M1 is M+1,find(A,B,E,M1,Z,C),!.

% Ќахождение уникальных чисел в последовательности;
numb(M,N):-find_numb(2,2,M,N,0,1).
find_numb(A,_,M,_,Z,_):-A>M,!,write(Z).
find_numb(A,B,M,N,Z,K):-B>N,A1 is A+1,K1 is K+1,find_numb(A1,2,M,N,Z,K1),!.
find_numb(A,B,M,N,Z,K):-B=<K+2,pow(A,B,T),check(T,2,1,2,N,A),B1 is B+1,find_numb(A,B1,M,N,Z,K),!.
find_numb(A,B,M,N,Z,K):-B1 is B+1,Z1 is Z+1,find_numb(A,B1,M,N,Z1,K),!.
