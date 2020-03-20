%�������;
man(anatoliy).
man(stepan).
man(dimitriy).
man(kolya).

%�������;
woman(zoya).
woman(irina).
woman(anya).
woman(larisa).
woman(tanya).
woman(vika).

%����;
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

%������� � �������;
grandpa(X,Y):-man(Y),child(X,Z),child(Z,Y).
grandma(X,Y):-woman(Y),child(X,Z),child(Z,Y).

%���� � ������
brother(X,Y):-
    man(Y),man(Z),child(X,Z),child(Y,Z),
    woman(T),child(X,T),child(Y,T),X\=Y.

sister(X,Y):-
    woman(Y),man(Z),child(X,Z),child(Y,Z),
    woman(T),child(X,T),child(Y,T),X\=Y.

sb(X,Y):-brother(X,Y);sister(X,Y).

%��� � ����, ����, ���;
aunt(X,Y):-woman(Y),child(X,Z),sister(Y,Z).
uncle(X,Y):-man(Y),child(X,Z),brother(Y,Z).
family(X,Y):-child(Z,X),child(Z,Y),Y\=X,!.
























