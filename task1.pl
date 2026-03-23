max_min(Number, Number, Number) :-
    Number < 10.

max_min(Number, Min, Max) :-
    Number >= 10,
    LastDigit is Number mod 10,
    Rest is Number // 10,
    max_min(Rest, MinRest, MaxRest),
    Min is min(LastDigit, MinRest),
    Max is max(LastDigit, MaxRest).

start :-
    write('Введите натуральное число: '), 
    read(N), nl,
    max_min(N, Min, Max),
    write('Наименьшая цифра: '), write(Min), nl,
    write('Наибольшая цифра: '), write(Max).