intersection([], _, []).
intersection([Head|Tail], B, [Head|Result]) :-
    member(Head, B), !,
    intersection(Tail, B, Result).
intersection([_|Tail], B, Result) :-
    intersection(Tail, B, Result).

complement(_, [], []).
complement(A, [Head|Tail], Result) :-
    member(Head, A), !,
    complement(A, Tail, Result).
complement(A, [Head|Tail], [Head|Result]) :-
    complement(A, Tail, Result).

union([], B, B).
union([Head|Tail], B, Result) :-
    member(Head, B), !,
    union(Tail, B, Result).
union([Head|Tail], B, [Head|Result]) :-
    union(Tail, B, Result).

remove_duplicates([], []).
remove_duplicates([Head|Tail], Result) :-
    member(Head, Tail), !,
    remove_duplicates(Tail, Result).
remove_duplicates([Head|Tail], [Head|Result]) :-
    remove_duplicates(Tail, Result).

sets_equal(A, B) :-
    msort(A, Sorted),
    msort(B, Sorted).

start :-
    write('not(A ∩ B) = not(A) ∪ not(B)'), nl,
    nl,
    write('ВАЖНО: все множества должны содержать элементы одного типа'), nl,
    write('ВАЖНО: A и B должны быть подмножествами U'), nl,
    write('ВАЖНО: U не должен быть пустым'), nl,
    nl,
    write('Введите универсальное множество U в формате [1,2,3]:'), nl,
    read(U),
    ( U = [] ->
        write('Ошибка: универсум не может быть пустым!'), nl
    ;
        write('Введите множество A в формате [1,2,3]:'), nl,
        read(A),
        write('Введите множество B в формате [1,2,3]:'), nl,
        read(B),
        intersection(A, B, AintersectB),
        complement(AintersectB, U, Left),
        remove_duplicates(Left, LeftSet),
        complement(A, U, NotA),
        complement(B, U, NotB),
        union(NotA, NotB, Right),
        remove_duplicates(Right, RightSet),
        nl,
        write('A ∩ B = '), write(AintersectB), nl,
        write('not(A ∩ B) = '), write(LeftSet), nl,
        write('not(A) = '), write(NotA), nl,
        write('not(B) = '), write(NotB), nl,
        write('not(A) ∪ not(B) = '), write(RightSet), nl,
        nl,
        ( sets_equal(LeftSet, RightSet) ->
            write('Закон де Моргана ВЫПОЛНЯЕТСЯ')
        ;
            write('Закон де Моргана НЕ выполняется')
        ), nl
    ).