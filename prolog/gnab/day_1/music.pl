musician(musician1).
musician(musician2).
musician(musician3).

instrument(guitar).
instrument(piano).
instrument(drums).

plays_instrument(musician1, guitar).
plays_instrument(musician2, guitar).
plays_instrument(musician2, piano).
plays_instrument(musician3, drums).
plays_instrument(musician3, piano).

belongs_to_genre(musician1, genre1).
belongs_to_genre(musician2, genre2).
belongs_to_genre(musician3, genre3).

/*
| ?- plays_instrument(Musician, guitar).

Musician = musician1 ? a

Musician = musician2

no
*/
