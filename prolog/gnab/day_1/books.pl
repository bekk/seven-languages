book(book1).
book(book2).
book(book3).

author(author1).
author(author2).
author(author3).

authored_by(book1, author1).
authored_by(book1, author2).
authored_by(book2, author2).
authored_by(book2, author3).
authored_by(book3, author3).

multiple_authors(B) :- book(B), author(A1), author(A2), authored_by(B, A1), authored_by(B, A2), \+(A1 = A2).

single_author(B) :- book(B), authored_by(B, A), author(A), \+(multiple_authors(B)).

/*
| ?- single_author(Book).

Book = book3

yes
*/
