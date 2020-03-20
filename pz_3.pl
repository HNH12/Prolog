%Чтение списка;
read_list(A,N):-r(A,[],0,N).
r(A,A,N,N):-!.
r(A,B,X,N):-X1 is X+1,read(D),append(B,[D],B1),r(A,B1,X1,N).

%Произведение элементов списка;
pr_1:-read(N),read_list(A,N),proizv(A,Z),write(Z).
proizv([H],H):-!.
proizv([H|T],S):-proizv(T,S1),S is S1*H,!.

%Поиск элемента по индексу;
pr_2:-read(N),read_list(A,N),write("Введите индекс"),read(I),ind(A,I,Z),write(Z).
ind([H|_],0,H):-!.
ind([_|T],I,Z):-I1 is I-1,ind(T,I1,Z).

%Минимальный элемент, который есть в списке;
pr_3:-read(N),read_list(A,N),min(A,Min1),write(Min1).
min([H|T],Min):-min_list(T,H,Min).
min_list([],M,M):-!.
min_list([H|T],Min,M):-H<Min,min_list(T,H,M).
min_list([_|T],Min,M):-min_list(T,Min,M).

%True, если элемент есть в списке;
pr_4:-read(N), read_list(A,N),read(E),find(A,E).
find([H|_],H).
find([_|T],E):-find(T,E).

%Номер элемента в списке;
pr_5:-read(N),read_list(A,N),read(El),find_elem(A,0,El,N,Ind),write(Ind).
find_elem(_,N,_,N,_):-!,fail.
find_elem(A,I,El,_,Ind):-ind(A,I,Z),Z=El,Ind is I.
find_elem(A,I,El,N,Ind):-I1 is I+1,find_elem(A,I1,El,N,Ind).

%Переворачивает список;
pr_6:-read(N),read_list(A,N),rotate(A,[],R,N-1),write(R).
rotate(A,B,R,X):-ind(A,X,Z),append(B,[Z],B1),X1 is X-1,rotate(A,B1,R,X1),!.
rotate(_,B,B,X):-X<0,!.

%Является ли введенная строка подстрокой исходной строки;
pr_7:-read(N),read_list(A,N),read(NS),NS=<N,read_list(S,NS),sublist(A,S,S,N,NS,0).
sublist(_,_,_,0,NS,N1):-N1<NS,!,fail.
sublist(_,_,_,_,NS,N1):-NS=N1,!.
sublist([H|T],[H1|T1],S,N,NS,N1):-H=H1,N2 is N1+1,NN is N-1,sublist(T,T1,S,NN,NS,N2).
sublist([_|T],_,S,N,NS,_):-NN is N-1,sublist(T,S,S,NN,NS,0).

%Удаляет элемент с заданным номером;
pr_8:-read(N),read_list(A,N),read(Ind),delete(A,[],R,0,Ind),write(R).
delete([],R,R,_,_):-!.
delete([H|T],B,R,I,Ind):-I\=Ind,append(B,[H],B1),I1 is I+1,delete(T,B1,R,I1,Ind).
delete([_|T],B,R,I,Ind):-I1 is I+1,delete(T,B,R,I1,Ind).

%Удаляет все вхождения элемента;
pr_9:-read(N),read_list(A,N),read(X),delete_all(A,B,[],X),write(B).
delete_all([],B,B,_):-!.
delete_all([H|T],B,C,X):-H=X,delete_all(T,B,C,X).
delete_all([H|T],B,C,X):-append(C,[H],C1),delete_all(T,B,C1,X).

%Проверяет, что все элементы в списке уникальны;
pr_10:-read(N),read_list(A,N),check(A).
check([]).
check([H|T]):-find(T,H),!,fail.
check([_|T]):-check(T).

%Формирует список, который состоит из уникальныъ элементов введенного;
pr_11:-read(N),read_list(A,N),new_list(A,[],B),write(B).
new_list([],B,B):-!.
new_list([H|T],C,B):-find(T,H),delete_all([H|T],A1,[],H),append(C,[H],C1),new_list(A1,C1,B).
new_list([H|T],C,B):-append(C,[H],C1),new_list(T,C1,B).

%Количество раз, которое элемент встречается в списке;
pr_12:-read(N),read_list(A,N),read(EL),count(A,EL,K,0),write(K).
count([],_,K,K):-!.
count([H|T],H,K,K1):-K2 is K1+1,count(T,H,K,K2),!.
count([_|T],EL,K,K1):-count(T,EL,K,K1).

%Длина списка;
pr_13:-read(N),read_list(A,N),lengh(A,D),write(D).
lengh([],0):-!.
lengh([_|T],D):-lengh(T,D1),D is D1+1.



