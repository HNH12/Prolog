%Мужчины;
man(anatoliy).
man(stepan).
man(dimitriy).
man(kolya).

%Женщины;
woman(zoya).
woman(irina).
woman(anya).
woman(larisa).
woman(tanya).
woman(vika).

%Дети;
child(stepan, anatoliy).
child(stepan, zoya).
child(dimitriy, anatoliy).
child(dimitriy,zoya).
child(kolya, stepan).
child(kolya, irina).
child(anya, stepan).
child(anya, irina).
child(tanya, dimitriy).
child(tanya, larisa).
child(vika, dimitriy).
child(vika, larisa).

%Дедушка и бабушка;
grandpa(X,Y):-man(Y),child(X,Z),child(Z,Y).
grandma(X,Y):-woman(Y),child(X,Z),child(Z,Y).

%Брат и сестра
brother(X,Y):-
    man(Y),man(Z),child(X,Z),child(Y,Z),
    woman(T),child(X,T),child(Y,T),X\=Y.

sister(X,Y):-
    woman(Y),man(Z),child(X,Z),child(Y,Z),
    woman(T),child(X,T),child(Y,T),X\=Y.

sb(X,Y):-brother(X,Y);sister(X,Y).

%Муж и жена, дядя, тётя;
aunt(X,Y):-woman(Y),child(X,Z),sister(Y,Z).
uncle(X,Y):-man(Y),child(X,Z),brother(Y,Z).
family(X,Y):-child(Z,X),child(Z,Y),Y\=X,!.
























