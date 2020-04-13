:- dynamic sochet/1.
:- dynamic words/1.

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

pr1:-read(X),name(A,X),asserta(sochet(A)).


member1([X|_],X):-!.
member1([_|L],X):-member1(L,X),!.

count_repeat(A,El,N):-count_repeat(A,El,N,0).
count_repeat([],_,N,N):-!.
count_repeat([H|T],El,N,K):-H=El,K1 is K+1,count_repeat(T,El,N,K1),!.
count_repeat([_|T],El,N,K):-count_repeat(T,El,N,K).

repeat_twice([],_):-!.
repeat_twice([H|T],A):-count_repeat(A,H,N),!,N=2,repeat_twice(T,A).

delete_char(A,El,B):-delete_char(A,El,B,[]).
delete_char([],_,B,B):-!.
delete_char([H|T],H,B,C):-delete_char(T,H,B,C),!.
delete_char([H|T],El,B,C):-append(C,[H],C1),delete_char(T,El,B,C1).

delete_repeat(A,B):-delete_repeat(A,B,[]).
delete_repeat([],B,B):-!.
delete_repeat([H|T],B,C):-append(C,[H],C1),delete_char([H|T],H,NewList),delete_repeat(NewList,B,C1).

add_module_two(A,B):-C=[97,98,99,100,101,102],add_module_two(C,A,B,[]).
add_module_two([],_,D,D):-!.
add_module_two([H|T],B,D,C):-member1(B,H),add_module_two(T,B,D,C),!.
add_module_two([H|T],B,D,C):-append(C,[H],C1),add_module_two(T,B,D,C1).

list_without_twice_char(A,8):-all_perestanovki(A).
list_without_twice_char(A,9):-delete_repeat(A,B),add_module_two(B,C),perestanovka(C,[H|_]),append(A,[H],D),all_perestanovki(D).
list_without_twice_char(A,10):-delete_repeat(A,B),add_module_two(B,C),append(A,C,D),all_perestanovki(D).


%Выводит все сочетания;
comb:-A=[97,97,98,98,99,99,100,100,101,101,102,102],
		write("Введите длину слов:\n"),read(N),
		(N>=8,N=<10->comb(A,8,B),(not(sochet(B)),repeat_twice(B,B)->
					 tell('Word1.txt'),asserta(sochet(B)),list_without_twice_char(B,N),told,fail)
		;write("Неверная длина"),fail).

comb([],0,[]).
comb([X|List],N, [X|Tail]) :-N1 is N-1,comb(List,N1, Tail).
comb([_|List],N, Tail) :-comb(List,N, Tail).

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).

all_perestanovki(A):-perestanovka(A,P),(not(words(P))->asserta(words(P)),write_str(P),nl,fail).

perestanovka([],[]).
perestanovka(List,[H|Perm]):-delete1(H,List,Rest),perestanovka(Rest,Perm).

delete1(X,[X|T],T).
delete1(X,[H|T],[H|NT]):-delete1(X,T,NT).













