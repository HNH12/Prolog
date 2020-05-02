:- dynamic q1/2.
:- dynamic q2/2.
:- dynamic q3/2.
:- dynamic q4/2.
:- dynamic q5/2.
:- dynamic q6/2.
:- dynamic q7/2.
:- dynamic q8/2.
:- dynamic q9/2.

:- dynamic q10/2.
:- dynamic q11/2.
:- dynamic q12/2.
:- dynamic q13/2.
:- dynamic q14/2.
:- dynamic q15/2.
:- dynamic q16/2.
:- dynamic q17/2.
:- dynamic q18/2.
:- dynamic q19/2.
:- dynamic q20/2.
:- dynamic q21/2.

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

q1_r(X,Y):-repeat, (q1(X,Y) -> (write(X),nl,write(Y),nl,retract(q1(X,Y)));X=nil,Y=nil).
q2_r(X,Y):-repeat, (q2(X,Y) -> (write(X),nl,write(Y),nl,retract(q2(X,Y)));X=nil,Y=nil).
q3_r(X,Y):-repeat, (q3(X,Y) -> (write(X),nl,write(Y),nl,retract(q3(X,Y)));X=nil,Y=nil).
q4_r(X,Y):-repeat, (q4(X,Y) -> (write(X),nl,write(Y),nl,retract(q4(X,Y)));X=nil,Y=nil).
q5_r(X,Y):-repeat, (q5(X,Y) -> (write(X),nl,write(Y),nl,retract(q5(X,Y)));X=nil,Y=nil).
q6_r(X,Y):-repeat, (q6(X,Y) -> (write(X),nl,write(Y),nl,retract(q6(X,Y)));X=nil,Y=nil).
q7_r(X,Y):-repeat, (q7(X,Y) -> (write(X),nl,write(Y),nl,retract(q7(X,Y)));X=nil,Y=nil).
q8_r(X,Y):-repeat, (q8(X,Y) -> (write(X),nl,write(Y),nl,retract(q8(X,Y)));X=nil,Y=nil).
q9_r(X,Y):-repeat, (q9(X,Y) -> (write(X),nl,write(Y),nl,retract(q9(X,Y)));X=nil,Y=nil).

q10_r(X,Y):-repeat, (q10(X,Y) -> (write(X),nl,write(Y),nl,retract(q10(X,Y)));X=nil,Y=nil).
q11_r(X,Y):-repeat, (q11(X,Y) -> (write(X),nl,write(Y),nl,retract(q11(X,Y)));X=nil,Y=nil).
q12_r(X,Y):-repeat, (q12(X,Y) -> (write(X),nl,write(Y),nl,retract(q12(X,Y)));X=nil,Y=nil).
q13_r(X,Y):-repeat, (q13(X,Y) -> (write(X),nl,write(Y),nl,retract(q13(X,Y)));X=nil,Y=nil).
q14_r(X,Y):-repeat, (q14(X,Y) -> (write(X),nl,write(Y),nl,retract(q14(X,Y)));X=nil,Y=nil).
q15_r(X,Y):-repeat, (q15(X,Y) -> (write(X),nl,write(Y),nl,retract(q15(X,Y)));X=nil,Y=nil).
q16_r(X,Y):-repeat, (q16(X,Y) -> (write(X),nl,write(Y),nl,retract(q16(X,Y)));X=nil,Y=nil).
q17_r(X,Y):-repeat, (q17(X,Y) -> (write(X),nl,write(Y),nl,retract(q17(X,Y)));X=nil,Y=nil).
q18_r(X,Y):-repeat, (q18(X,Y) -> (write(X),nl,write(Y),nl,retract(q18(X,Y)));X=nil,Y=nil).
q19_r(X,Y):-repeat, (q19(X,Y) -> (write(X),nl,write(Y),nl,retract(q19(X,Y)));X=nil,Y=nil).
q20_r(X,Y):-repeat, (q20(X,Y) -> (write(X),nl,write(Y),nl,retract(q20(X,Y)));X=nil,Y=nil).
q21_r(X,Y):-repeat, (q21(X,Y) -> (write(X),nl,write(Y),nl,retract(q21(X,Y)));X=nil,Y=nil).

q1_write_file:-tell('c:/DataBase/q1.txt'),q1_r(X,Y),X=nil,told,!.
q2_write_file:-tell('c:/DataBase/q2.txt'),q2_r(X,Y),X=nil,told,!.
q3_write_file:-tell('c:/DataBase/q3.txt'),q3_r(X,Y),X=nil,told,!.
q4_write_file:-tell('c:/DataBase/q4.txt'),q4_r(X,Y),X=nil,told,!.
q5_write_file:-tell('c:/DataBase/q5.txt'),q5_r(X,Y),X=nil,told,!.
q6_write_file:-tell('c:/DataBase/q6.txt'),q6_r(X,Y),X=nil,told,!.
q7_write_file:-tell('c:/DataBase/q7.txt'),q7_r(X,Y),X=nil,told,!.
q8_write_file:-tell('c:/DataBase/q8.txt'),q8_r(X,Y),X=nil,told,!.
q9_write_file:-tell('c:/DataBase/q9.txt'),q9_r(X,Y),X=nil,told,!.

q10_write_file:-tell('c:/DataBase/q10.txt'),q10_r(X,Y),X=nil,told,!.
q11_write_file:-tell('c:/DataBase/q11.txt'),q11_r(X,Y),X=nil,told,!.
q12_write_file:-tell('c:/DataBase/q12.txt'),q12_r(X,Y),X=nil,told,!.
q13_write_file:-tell('c:/DataBase/q13.txt'),q13_r(X,Y),X=nil,told,!.
q14_write_file:-tell('c:/DataBase/q14.txt'),q14_r(X,Y),X=nil,told,!.
q15_write_file:-tell('c:/DataBase/q15.txt'),q15_r(X,Y),X=nil,told,!.
q16_write_file:-tell('c:/DataBase/q16.txt'),q16_r(X,Y),X=nil,told,!.
q17_write_file:-tell('c:/DataBase/q17.txt'),q17_r(X,Y),X=nil,told,!.
q18_write_file:-tell('c:/DataBase/q18.txt'),q18_r(X,Y),X=nil,told,!.
q19_write_file:-tell('c:/DataBase/q19.txt'),q19_r(X,Y),X=nil,told,!.
q20_write_file:-tell('c:/DataBase/q20.txt'),q20_r(X,Y),X=nil,told,!.
q21_write_file:-tell('c:/DataBase/q21.txt'),q21_r(X,Y),X=nil,told,!.

read_q(A,X,Y):-read_list(A,[],X,Y).

read_list([H|T],[],X,Y):-append([],H,C),read_list(T,C,X,Y).
read_list([[H|_]|_],B,X,Y):-B\=[],name(A,[H]),X = A,name(Q,B),Y = Q.
read_list([_|T],B,X,Y):-B\=[],read_list(T,[],X,Y).

q1_read_file:-see('c:/DataBase/q1.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q1(X,Y)),A=[].
q2_read_file:-see('c:/DataBase/q2.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q2(X,Y)),A=[].
q3_read_file:-see('c:/DataBase/q3.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q3(X,Y)),A=[].
q4_read_file:-see('c:/DataBase/q4.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q4(X,Y)),A=[].
q5_read_file:-see('c:/DataBase/q5.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q5(X,Y)),A=[].
q6_read_file:-see('c:/DataBase/q6.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q6(X,Y)),A=[].
q7_read_file:-see('c:/DataBase/q7.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q7(X,Y)),A=[].
q8_read_file:-see('c:/DataBase/q8.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q8(X,Y)),A=[].
q9_read_file:-see('c:/DataBase/q9.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q9(X,Y)),A=[].

q10_read_file:-see('c:/DataBase/q10.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q10(X,Y)),A=[].
q11_read_file:-see('c:/DataBase/q11.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q11(X,Y)),A=[].
q12_read_file:-see('c:/DataBase/q12.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q12(X,Y)),A=[].
q13_read_file:-see('c:/DataBase/q13.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q13(X,Y)),A=[].
q14_read_file:-see('c:/DataBase/q14.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q14(X,Y)),A=[].
q15_read_file:-see('c:/DataBase/q15.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q15(X,Y)),A=[].
q16_read_file:-see('c:/DataBase/q16.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q16(X,Y)),A=[].
q17_read_file:-see('c:/DataBase/q17.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q17(X,Y)),A=[].
q18_read_file:-see('c:/DataBase/q18.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q18(X,Y)),A=[].
q19_read_file:-see('c:/DataBase/q19.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q19(X,Y)),A=[].
q20_read_file:-see('c:/DataBase/q20.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q20(X,Y)),A=[].
q21_read_file:-see('c:/DataBase/q21.txt'),read_str_str(A),seen,
    read_q(A,Y,X),asserta(q21(X,Y)),A=[].

% ������ ���� ������;
read_facts:-(q1_read_file->true;true),(q2_read_file->true;true),(q3_read_file->true;true),
    (q4_read_file->true;true),(q5_read_file->true;true),(q6_read_file->true;true),
    (q7_read_file->true;true),(q8_read_file->true;true),(q9_read_file->true;true),
    (q10_read_file->true;true),(q11_read_file->true;true),(q12_read_file->true;true),
    (q13_read_file->true;true),(q14_read_file->true;true),(q15_read_file->true;true),
    (q16_read_file->true;true),(q17_read_file->true;true),(q18_read_file->true;true),
    (q19_read_file->true;true),(q20_read_file->true;true),(q21_read_file->true;true).

% ������ � ����;
write_facts:-q1_write_file,q2_write_file,q3_write_file,q4_write_file,q5_write_file,
    q6_write_file,q7_write_file,q8_write_file,q9_write_file,q10_write_file,
    q11_write_file,q12_write_file,q13_write_file,q14_write_file,q15_write_file,
    q16_write_file,q17_write_file,q18_write_file,q19_write_file,q20_write_file,
    q21_write_file.

question1(X):-	write("\n������� ��� �������"),nl,
				write("2. �������"),nl,
				write("1. �������"),nl,
                                write("0. �� �������"),nl,
				read(X).

question2(X):-write("\n��� �� ������\n?"),nl,
				write("2. ��"),nl,
				write("1. ���"),nl,
                                write("0. ���, �� ��� �� �����"),nl,
				read(X).

question3(X):-write("\n� ������ ���� �����������?"),nl,
                                write("10. ����������"),nl,
                                write("9. ���������"),nl,
                                write("8. �������"),nl,
                                write("7. ������"),nl,
                                write("6. ������"),nl,
                                write("5. �����"),nl,
                                write("4. ��������"),nl,
                                write("3. ����������"),nl,
                                write("2. ��������"),nl,
                                write("1. �� ���, ���������� ������� �����"),nl,
                                write("0. ������"),nl,
                                read(X).

question4(X):-write("\n�� ������ ��� ���������?"),nl,                                                                    write("1. �� ������"),nl,
                                write("0. �� ���������"),nl,
                                read(X).

question5(X):-write("\n��� �� �������� �����"),nl,							                write("1. ��"),nl,
				write("0. ���"),nl,
				read(X).

question6(X):-nl,write("����� �� ��������� �����?"),nl,
                                write("1. ��"),nl,
                                write("0. ���"),nl,
                                read(X).

question7(X):-nl,write("������� �� ����������?"),nl,
                                write("1. ��"),nl,
                                write("0. ���"),nl,
                                read(X).

question8(X):-nl,write("��� ����� �������?"),nl,
                                write("1. ��"),nl,
                                write("0. ���"),nl,
                                read(X).

question9(X):-nl,write("� ����� ������ ��������?"),nl,
                                write("8. ������"),nl,
                                write("7. ������"),nl,
                                write("6. ������"),nl,
                                write("5. ������"),nl,
                                write("4. ������"),nl,
                                write("3. ������"),nl,
                                write("2. ������"),nl,
                                write("1. ������"),nl,
                                read(X).

question10(X):-nl,write("����� �� ���������� ������?"),nl,
                                write("1. �������� ������� �������"),nl,
                                write("0. ���"),nl,
                                read(X).

question11(X):-nl,write("�������� ������ �������� �����?"),nl,
                                write("1. ��"),nl,
                                write("0. ���"),nl,
                                read(X).

question12(X):-nl,write("���� �� ������� �������?"),nl,
                                write("1. ((("),nl,
                                write("0. ���"),nl,
                                read(X).
question13(X):-nl,write("����������� ��������� � ���������"),nl,
                                write("2. ��� ��������, ����� �� �����"),nl,
                                write("1. � ��������� ��������"),nl,
                                write("0. �����������"),nl,
                                read(X).

question14(X):-nl,write("������ ��� ���?"),nl,
                                write("3. ������ ���� ��������, �� �� �������"),nl,
                                write("2. ������ � �������"),nl,
                                write("1. ������ ��"),nl,
                                write("0. ������ ���"),nl,
                                read(X).

question15(X):-nl,write("�������� � ����?"),nl,
                                write("1. ��"),nl,
                                write("0. ���"),nl,
                                read(X).

question16(X):-nl,write("��������� ��� ���? (����� ������ ���� �� � ����)"),nl,
                                write("2. ���� � �� ���"),nl,
                                write("1. ��, � ��� ������ ���"),nl,
                                write("0. ���"),nl,
                                read(X).

question17(X):-nl,write("���� �� ����?"),nl,
                                write("2. �� � �����"),nl,
                                write("1. ������ ��"),nl,
                                write("0. ���"),nl,
                                read(X).

question18(X):-nl,write("������ �� �����?"),nl,
                                write("1. *������������� ���� ����"),nl,
                                write("0. ���"),nl,
                                read(X).

question19(X):-nl,write("�������� ���? (Hold The Door)"),nl,
                                write("1. �����"),nl,
                                write("0. ���"),nl,
                                read(X).

question20(X):-nl,write("����� ������ ������� ��� �������?"),nl,
                                write("2. � ������� � �������"),nl,
                                write("1. ������ �������, ���� ..."),nl,
                                write("0. ���"),nl,
                                read(X).

question21(X):-nl,write("�������� ���������� ��������� �����,
�������� �������� ������� � ������ �����, ��������� ���� ����������, ������ ��������,
������� �������� ��������� ����, ����������, ��������������� ����"),nl,
                                write("1. �� *��������� ������"),nl,
                                write("0. �� ��� �������"),nl,
                                read(X).

akkinator:-(read_facts->true;true),check.
check:-









