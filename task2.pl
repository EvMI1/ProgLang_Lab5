count_odd_negative([], 0).

count_odd_negative([Head|Tail], Count) :-
    Head < 0,
    Head mod 2 =\= 0, !,
    count_odd_negative(Tail, Rest),
    Count is Rest + 1.

count_odd_negative([_|Tail], Count) :-
    count_odd_negative(Tail, Count).

start :-
    write('Введите список целых чисел в формате [1, 2, 3, 4].:'), nl,
    read(List), nl,
    count_odd_negative(List, Count),
    write('Количество нечётных отрицательных элементов: '), write(Count), nl.