:- dynamic high/2.
:- dynamic decl/2.
:- dynamic oop/2.

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

high_r(X,Y):-repeat, (high(X,Y) -> (write(X),nl,write(Y),nl,retract(high(X,Y)));X=nil,Y=nil).
decl_r(X,Y):-repeat, (decl(X,Y) -> (write(X),nl,write(Y),nl,retract(decl(X,Y)));X=nil,Y=nil).
oop_r(X,Y):-repeat, (oop(X,Y) -> (write(X),nl,write(Y),nl,retract(oop(X,Y)));X=nil,Y=nil).

high_write_file:-tell('c:/DataBase/high.txt'),high_r(X,Y),X=nil,told,!.
decl_write_file:-tell('c:/DataBase/decl.txt'),decl_r(X,Y),X=nil,told,!.
oop_write_file:-tell('c:/DataBase/oop.txt'),oop_r(X,Y),X=nil,told,!.

read_list([H|T],[],X,Y):-append([],H,C),read_list(T,C,X,Y).
read_list([[H|_]|_],B,X,Y):-B\=[],name(A,[H]),X = A,name(Q,B),Y = Q.
read_list([_|T],B,X,Y):-B\=[],read_list(T,[],X,Y).

high_read_file:-see('c:/DataBase/high.txt'),read_str_str(A),seen,
    read_high(A,Y,X),asserta(high(X,Y)),A=[].
read_high(A,X,Y):-read_list(A,[],X,Y).

decl_read_file:-see('c:/DataBase/decl.txt'),read_str_str(A),seen,read_decl(A,Y,X),asserta(decl(X,Y)),A=[].
read_decl(A,X,Y):-read_list(A,[],X,Y).

oop_read_file:-see('c:/DataBase/oop.txt'),read_str_str(A),seen,read_oop(A,Y,X),asserta(oop(X,Y)),A=[].
read_oop(A,X,Y):-read_list(A,[],X,Y).

read_facts:-(high_read_file->true;true),(oop_read_file->true;true),(decl_read_file->true;true).
write_facts:-high_write_file,oop_write_file,decl_write_file.

question4(X4):-	write("Does your language support OOP?"),nl,
				write("3. It is OOP itself"),nl,
				write("2. yes"),nl,
				write("1. yes, but very hard"),nl,
				write("0. NO"),nl,
				read(X4).

question1(X1):-	write("Is your language high level?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X1).

question2(X2):-	write("Is your language declarative?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X2).

akkinator:-(read_facts->true;true),check.
check:-question1(X1),question2(X2),question4(X4),
       (high(X,X1),decl(X,X2),oop(X,X4)->write(X),write_facts;
            write("Помогите нам. Введите правильный ответ."),nl,
            read(X),
            asserta(decl(X,X2)),asserta(high(X,X1)),asserta(oop(X,X4)),write_facts).




