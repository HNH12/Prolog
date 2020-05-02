:- dynamic high/2.

read_word(A):-get0(X),r_w(X,A,[]).
r_w(32,A,A):-!.
r_w(X,A,B):-append(B,[X],B1),get0(X1),r_w(X1,A,B1).

read_str_str(A):-read_str_file(B,Flag),read_str_str(A,[B],Flag).
read_str_str(A,A,-1):-!.
read_str_str(A,Temp_list,10):-read_str_file(B,Flag),append(Temp_list,[B],T_L),
read_str_str(A,T_L,Flag).

read_str_file(A,Flag):-get0(X),r_str(X,A,[],Flag).
r_str(10,A,A,10):-!.
r_str(-1,A,A,-1):-!.
r_str(X,A,B,Flag):-append(B,[X],B1),get0(X1),r_str(X1,A,B1,Flag).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

pr1:-read_str(X,N),name(A,X),asserta(high(A,1)).

high_r(X,Y):-repeat, (high(X,Y) -> (write(X),nl,write(Y),nl,retract(high(X,Y))) ;X=nil,Y=nil).

pr2:-tell('c:/Test/prolog.txt'),high_r(X,Y),X=nil,told,!.

pr3:-see('c:/Test/prolog.txt'),read_str_str(A),seen,read_str(X,V),read_high(A,X,Y),write(Y).

read_high(A,X,Y):-read_list(A,[],X,Y).
read_list([H|T],[],X,Y):-append([],H,C),read_list(T,C,X,Y).
read_list([[H|_]|_],B,X,Y):-B\=[],[H]=X,name(Q,B),Y = Q.
read_list([_|T],B,X,Y):-B\=[],read_list(T,[],X,Y).
