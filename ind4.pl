in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

ind4:-Teacher=[_,_,_],
    in_list(Teacher,[morozov,_,_]),
    in_list(Teacher,[vasilev,_,_]),
    in_list(Teacher,[tokarev,_,_]),

   (in_list(Teacher,[_,history,_]);in_list(Teacher,[_,_,history])),
   (in_list(Teacher,[_,matem,_]);in_list(Teacher,[_,_,matem])),
   (in_list(Teacher,[_,angl,_]);in_list(Teacher,[_,_,angl])),
   (in_list(Teacher,[_,biolog,_]);in_list(Teacher,[_,_,biolog])),
   (in_list(Teacher,[_,geograf,_]);in_list(Teacher,[_,_,geograf])),
   (in_list(Teacher,[_,franch,_]);in_list(Teacher,[_,_,franch])),

    not(in_list(Teacher,[_,biolog,matem])),
    not(in_list(Teacher,[_,matem,biolog])),
    not(in_list(Teacher,[morozov,biolog,_])),
    not(in_list(Teacher,[morozov,_,biolog])),
    not(in_list(Teacher,[_,geograf,franch])),
    not(in_list(Teacher,[_,franch,geograf])),
    not(in_list(Teacher,[tokarev,biolog,_])),
    not(in_list(Teacher,[tokarev,_,biolog])),
    not(in_list(Teacher,[tokarev,franch,_])),
    not(in_list(Teacher,[tokarev,_,franch])),
    not(in_list(Teacher,[morozov,matem,_])),
    not(in_list(Teacher,[morozov,_,matem])),
    not(in_list(Teacher,[morozov,angl,_])),
    not(in_list(Teacher,[morozov,_,angl])),
    not(in_list(Teacher,[_,matem,angl])),
    not(in_list(Teacher,[_,angl,matem])),
    not(in_list(Teacher,[_,biolog,franch])),
    not(in_list(Teacher,[_,franch,biolog])),

write(Teacher),nl,!,
    in_list(Teacher,[morozov,FirstObject1,SecondObject1]),
    write(morozov),write(": "),
    write(FirstObject1),write(", "),
    write(SecondObject1),nl,

    in_list(Teacher,[vasilev,FirstObject2,SecondObject2]),
    write(vasilev),write(": "),
    write(FirstObject2),write(", "),
    write(SecondObject2),nl,

    in_list(Teacher,[tokarev,FirstObject3,SecondObject3]),
    write(tokarev),write(": "),
    write(FirstObject3),write(", "),
    write(SecondObject3),!.







