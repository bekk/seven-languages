musician(abbath).
musician(horgh).
musician(apollyon).
musician(demonaz).
musician(lars).
musician(martin).

instrument(bass).
instrument(vocals).
instrument(sax).
instrument(clarinet).
instrument(flute).
instrument(guitar).
instrument(piano).
instrument(percussion).
instrument(drums).

plays(abbath, bass).
plays(abbath, vocals).
plays(abbath, drums).
plays(abbath, guitar).
plays(demonaz, guitar).
plays(horgh, drums).
plays(apollyon, bass).
plays(lars, bass).	
plays(lars, vocals).
plays(lars, sax).
plays(lars, clarinet).
plays(lars, flute).
plays(lars, guitar).
plays(lars, piano).
plays(martin, percussion).
plays(martin, drums).

in_genre(abbath, black-metal).
in_genre(horgh, black-metal).
in_genre(apollyon, black-metal).
in_genre(demonaz, black-metal).
in_genre(lars, jazz).
in_genre(martin, jazz).


/*
| ?- plays(Artist, guitar).
Artist = abbath ? a
Artist = demonaz
Artist = lars
*/