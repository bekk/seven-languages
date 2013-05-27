/* Make a simple knowledge base. Represent some of your favorite books and authors. */

book(black_prism).
book(shadows_edge).
book(the_way_of_shadows).
book(the_magicians_guild).
book(the_ambassadors_mission).
book(seven_languages_in_seven_weeks).

author(brent_weeks).
author(trudi_canavan).
author(bruce_tate).

author_of(brent_weeks, black_prism).
author_of(brent_weeks, shadows_edge).
author_of(brent_weeks, the_way_of_shadows).
author_of(trudi_canavan, the_magicians_guild).
author_of(trudi_canavan, the_ambassadors_mission).
author_of(bruce_tate, seven_languages_in_seven_weeks).


/* Find all books in your knowledge base written by one author.

      * author_of(brent_weeks, Book).


   Make a knowledge base representing musicians and instruments.
   Also represent musicians and their genre of music.
*/

musician(tim).
musician(mike).
musician(john).
musician(paul).
musician(amber).

plays(tim, guitar).
plays(amber, guitar).
plays(john, tuba).
plays(mike, piano).
plays(paul, harp).

genre(tim, soul).
genre(amber, pop).
genre(john, metal).
genre(mike, rock).
genre(paul, classic).


/* Find all musicians who play the guitar.

      * plays(Musician, guitar).
*/