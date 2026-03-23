all_diff([]).
all_diff([Head|Tail]) :-
    \+ member(Head, Tail),
    all_diff(Tail).

solve(Morozov, Vasiliev, Tokarev) :-
    Subjects = [история, математика, биология, география, английский, французский],
    % на учителя по 2 предмета
    member(S1, Subjects), member(S2, Subjects),
    member(S3, Subjects), member(S4, Subjects),
    member(S5, Subjects), member(S6, Subjects),
    all_diff([S1, S2, S3, S4, S5, S6]),
    Morozov  = [S1, S2],
    Vasiliev = [S3, S4],
    Tokarev  = [S5, S6],
    % Условие: Морозов самый молодой — не биолог и не математик
    \+ member(биология, Morozov),
    \+ member(математика, Morozov),
    % Условие: биолог и математик — разные люди
    \+ (member(биология, Morozov),  member(математика, Morozov)),
    \+ (member(биология, Vasiliev), member(математика, Vasiliev)),
    \+ (member(биология, Tokarev),  member(математика, Tokarev)),
    % Условие: на рыбалке Морозов, математик, англичанин — три разных человека
    \+ member(английский, Morozov),
    \+ (member(математика, Vasiliev), member(английский, Vasiliev)),
    \+ (member(математика, Tokarev),  member(английский, Tokarev)),
    % Условие: первый урок у Токарева, биолога, француза — три разных человека
    \+ member(биология, Tokarev),
    \+ member(французский, Tokarev),
    \+ (member(биология, Vasiliev), member(французский, Vasiliev)),
    % Условие: географ и француз — соседи, то есть разные люди
    \+ (member(география, Morozov),  member(французский, Morozov)),
    \+ (member(география, Vasiliev), member(французский, Vasiliev)),
    \+ (member(география, Tokarev),  member(французский, Tokarev)).

start :-
    ( solve(Morozov, Vasiliev, Tokarev) ->
        write('Результат:'), nl,
        format('  Морозов:  ~w~n', [Morozov]),
        format('  Васильев: ~w~n', [Vasiliev]),
        format('  Токарев:  ~w~n', [Tokarev])
    ;
        write('Решение не найдено')
    ), nl.