read_word(A):-get0(X),r_w(X,A,[]).
r_w(32,A,A):-!.
r_w(X,A,B):-append(B,[X],B1),get0(X1),r_w(X1,A,B1).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

write_str([]):-!.
write_str([H|T]):-put(H),write_str(T).

last_elem_stek([H],H):-!.
last_elem_stek([_|T],El):-last_elem_stek(T,El).

pop_stek([_],B,B):-!.
pop_stek([H|T],B,C):-append(C,[H],C1),pop_stek(T,B,C1).

next_elem([],0):-!.
next_elem([H|_],H).

numb([],Numb,Numb,_,0):-!.
numb([],Numb,CNumb,_,1):-Numb1 is CNumb*(-1),numb([],Numb,Numb1,_,0),!.

numb([H|T],Numb,CurrentNumb,C,0):-H=45,numb(T,Numb,CurrentNumb,C,1),!.
numb(A,Numb,CurrentNumb,C,Flag):-last_elem_stek(A,El),pop_stek(A,B,[]),NewCurrentNumb is CurrentNumb + C *(El-48),
    C1 is C*10,numb(B,Numb,NewCurrentNumb,C1,Flag),!.

solution_example(A,B,Answer,43):-numb(A,FirstNumb,0,1,0),numb(B,SecondNumb,0,1,0),
    Answer is FirstNumb+SecondNumb,!.
solution_example(A,B,Answer,45):-numb(A,FirstNumb,0,1,0),numb(B,SecondNumb,0,1,0),
    Answer is SecondNumb-FirstNumb,!.
solution_example(A,B,Answer,42):-numb(A,FirstNumb,0,1,0),numb(B,SecondNumb,0,1,0),
    Answer is FirstNumb*SecondNumb,!.
solution_example(A,B,Answer,47):-numb(A,FirstNumb,0,1,0),numb(B,SecondNumb,0,1,0),
    Answer is SecondNumb/FirstNumb,!.

append_to_begin([],_,B,B,0):-!.
append_to_begin(A,B,C,V,1):-B1 is B+48,append(C,[B1],C1),append_to_begin(A,_,C1,V,0),!.
append_to_begin([H|T],B,C,V,0):-append(C,[H],C1),append_to_begin(T,B,C1,V,0).

append_to_begin_symb([],_,C,C,1):-!.
append_to_begin_symb(A,El,C,B,0):-append(B,[El],B1),append_to_begin_symb(A,El,C,B1,1),!.
append_to_begin_symb([H|T],_,C,B,1):-append(B,[H],B1),append_to_begin_symb(T,_,C,B1,1).

push_stek_symb(0,B,B,0):-!.
push_stek_symb(0,B,C,1):-append_to_begin_symb(C,45,C1,[],0),push_stek_symb(0,B,C1,0),!.
push_stek_symb(A,B,[],0):-A<0,A1 is A*(-1),push_stek_symb(A1,B,[],1),!.
push_stek_symb(A,B,C,Flag):-R is A mod 10,A1 is A div 10, append_to_begin(C,R,[],NewC,1),
    push_stek_symb(A1,B,NewC,Flag),!.

example:-read_str(A,_),polsk(A,B,[],[],1),solution_polsk(B,[],[],Answer,0),
    write_str(B),nl,write(Answer).

solution_polsk([],_,Stek,A,_):-last_elem_stek(Stek,El),numb(El,Numb,0,1,0),A is Numb,!.

solution_polsk([H|T],CurrentNumb,StekNumb,Answer,CurrentAnswer):-
    priority(P,H),P=0,H\=46,append(CurrentNumb,[H],NewCurrentNumb),
    solution_polsk(T,NewCurrentNumb,StekNumb,Answer,CurrentAnswer),!.

solution_polsk([H|T],CurrentNumb,StekNumb,Answer,CurrentAnswer):-
    priority(P,H),P=0,H=46,append(StekNumb,[CurrentNumb],NewStekNumb),
    solution_polsk(T,[],NewStekNumb,Answer,CurrentAnswer),!.

solution_polsk([H|T],_,StekNumb,Answer,CurrentAnswer):-
    priority(P,H),P\=0,last_elem_stek(StekNumb,FirstNumb),pop_stek(StekNumb,NewStekNumb,[]),
    last_elem_stek(NewStekNumb,SecondNumb),pop_stek(NewStekNumb,FinalNewStekNumb,[]),
    solution_example(FirstNumb,SecondNumb,NewCurrentAnswer,H),
    FinalNewCurrentAnswer is NewCurrentAnswer+CurrentAnswer,
    push_stek_symb(NewCurrentAnswer,NewNumb,[],0),append(FinalNewStekNumb,[NewNumb],AbsFinalNewStekNumb),
    solution_polsk(T,[],AbsFinalNewStekNumb,Answer,FinalNewCurrentAnswer).

priority(1,43):-!.
priority(2,45):-!.
priority(3,42):-!.
priority(3,47):-!.
priority(-1,40):-!.
priority(-2,41):-!.
priority(0,_):-!.

polsk([],B,B,[],_):-!.
polsk([],B,Out,[H|T],1):-append(Out,[46],NewOut),last_elem_stek([H|T],LastElem),
    append(NewOut,[LastElem],NewOutPoint),pop_stek([H|T],NewStek,[]),
    polsk([],B,NewOutPoint,NewStek,0),!.

polsk([],B,Out,[H|T],0):-last_elem_stek([H|T],LastElem),append(Out,[LastElem],NewOut),
    pop_stek([H|T],NewStek,[]),polsk([],B,NewOut,NewStek,0),!.

polsk([H|T],B,Out,[],1):-priority(P,H),P\=0,
    append(Out,[46],NewOut),append([],[H],NewStek),polsk(T,B,NewOut,NewStek,0),!.

polsk([H|T],B,Out,[],0):-priority(P,H),P\=0,
    append([],[H],NewStek),polsk(T,B,Out,NewStek,0),!.

polsk([H|T],B,Out,Stek,1):-priority(P,H),P\=0,last_elem_stek(Stek,LastElem),
    priority(P2,LastElem),P=<P2,
    pop_stek(Stek,PopStek,[]),last_elem_stek(PopStek,El),priority(P3,El),P3>P,
    append(Out,[46],OutPoint),append(OutPoint,[LastElem],NewOut),
    append(NewOut,[El],FinalNewOut),pop_stek(PopStek,FinalPopStek,[]),
    append(FinalPopStek,[H],NewStek),polsk(T,B,FinalNewOut,NewStek,0),!.

polsk([H|T],B,Out,Stek,0):-priority(P,H),P\=0,last_elem_stek(Stek,LastElem),
    priority(P2,LastElem),P=<P2,
    pop_stek(Stek,PopStek,[]),last_elem_stek(PopStek,El),priority(P3,El),P3>P,
    append(Out,[LastElem],NewOut),
    pop_stek(PopStek,FinalPopStek,[]),append(FinalPopStek,[H],NewStek),polsk(T,B,NewOut,NewStek,0),!.

polsk([H|T],B,Out,Stek,1):-priority(P,H),P\=0,last_elem_stek(Stek,LastElem),
    priority(P2,LastElem),P=<P2,append(Out,[46],OutPoint),append(OutPoint,[LastElem],NewOut),
    pop_stek(Stek,PopStek,[]),append(PopStek,[H],NewStek),polsk(T,B,NewOut,NewStek,0),!.

polsk([H|T],B,Out,Stek,0):-priority(P,H),P\=0,last_elem_stek(Stek,LastElem),
    priority(P2,LastElem),P=<P2,append(Out,[LastElem],NewOut),
    pop_stek(Stek,PopStek,[]),append(PopStek,[H],NewStek),polsk(T,B,NewOut,NewStek,0),!.

polsk([H|T],B,Out,Stek,1):-priority(P,H),P\=0,append(Stek,[H],NewStek),append(Out,[46],NewOut),
    polsk(T,B,NewOut,NewStek,0),!.

polsk([H|T],B,Out,Stek,0):-priority(P,H),P\=0,append(Stek,[H],NewStek),
    polsk(T,B,Out,NewStek,0),!.

polsk([H|T],B,Out,Stek,_):-append(Out,[H],NewOut),polsk(T,B,NewOut,Stek,1).











