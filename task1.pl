:- initialization(main, main).

max_min(Number, Number, Number) :-
    Number < 10.

max_min(Number, Min, Max) :-
    Number >= 10,
    LastDigit is Number mod 10,
    Rem is Number // 10,
    max_min(Rem, MinRem, MaxRem),
    Min is min(LastDigit, MinRem),
    Max is max(LastDigit, MaxRem).

main :-
    write("Введите натуральное число: "),
    read_line_to_string(user_input, Line),
    number_string(Number, Line),
    max_min(Number, Min, Max),
    write("Наименьшая цифра: "), write(Min), nl,
    write("Наибольшая цифра: "), write(Max), nl,
    halt.
