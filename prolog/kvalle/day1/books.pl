/* facts */

book(foundation).
book(freakonomics).
book(a-hole-in-space).
book(ringworld).
book(animal-farm).
book(nineteen-eighty-four).
book(bible).

author(niven).
author(asimov).
author(orwell).
author(levitt).
author(dubner).

written_by(foundation, asimov).
written_by(freakonomics, dubner).
written_by(freakonomics, levitt).
written_by(a-hole-in-space, niven).
written_by(ringworld, niven).
written_by(animal-farm, orwell).
written_by(nineteen-eighty-four, orwell).

/* rules */

has_author(Book) :- book(Book), written_by(Book, X).
multiple_authors(Book) :- written_by(Book, X), written_by(Book, Y), \+(X = Y), author(X), author(Y).
single_author(Book) :- has_author(Book), \+(multiple_authors(Book)).

/* query examples */

/*
author(levitt).
yes

| ?- written_by(Book, orwell).
Book = animal-farm ? ;
Book = nineteen-eighty-four
(4 ms) yes

| ?- written_by(freakonomics, Author).
Author = dubner ? a
Author = levitt
yes

| ?- single_author(Book).
Book = foundation ? a
Book = a-hole-in-space
Book = ringworld
Book = animal-farm
Book = nineteen-eighty-four
no

| ?- multiple_authors(Book).
Book = freakonomics ? a
Book = freakonomics
no
*/