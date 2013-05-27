/* Modify the Sudoku solver to work on six-by-six puzzles (squares are 3x2) and 9x9 puzzles. */

sudoku(Puzzle) :-

	Puzzle = [S11, S12, S13, S14, S15, S16, S17, S18, S19,
		        S21, S22, S23, S24, S25, S26, S27, S28, S29,
		        S31, S32, S33, S34, S35, S36, S37, S38, S39,
		        S41, S42, S43, S44, S45, S46, S47, S48, S49,
		        S51, S52, S53, S54, S55, S56, S57, S58, S59,
		        S61, S62, S63, S64, S65, S66, S67, S68, S69,
		        S71, S72, S73, S74, S75, S76, S77, S78, S79,
		        S81, S82, S83, S84, S85, S86, S87, S88, S89,
		        S91, S92, S93, S94, S95, S96, S97, S98, S99],

	fd_domain(Puzzle, 1, 9),

	fd_all_different([S11, S12, S13, S14, S15, S16, S17, S18, S19]),
	fd_all_different([S21, S22, S23, S24, S25, S26, S27, S28, S29]),
	fd_all_different([S31, S32, S33, S34, S35, S36, S37, S38, S39]),
	fd_all_different([S41, S42, S43, S44, S45, S46, S47, S48, S49]),
	fd_all_different([S51, S52, S53, S54, S55, S56, S57, S58, S59]),
	fd_all_different([S61, S62, S63, S64, S65, S66, S67, S68, S69]),
	fd_all_different([S71, S72, S73, S74, S75, S76, S77, S78, S79]),
	fd_all_different([S81, S82, S83, S84, S85, S86, S87, S88, S89]),
	fd_all_different([S91, S92, S93, S94, S95, S96, S97, S98, S99]),

	fd_all_different([S11, S21, S31, S41, S51, S61, S71, S81, S91]),
	fd_all_different([S12, S22, S32, S42, S52, S62, S72, S82, S92]),
	fd_all_different([S13, S23, S33, S43, S53, S63, S73, S83, S93]),
	fd_all_different([S14, S24, S34, S44, S54, S64, S74, S84, S94]),
	fd_all_different([S15, S25, S35, S45, S55, S65, S75, S85, S95]),
	fd_all_different([S16, S26, S36, S46, S56, S66, S76, S86, S96]),
	fd_all_different([S17, S27, S37, S47, S57, S67, S77, S87, S97]),
	fd_all_different([S18, S28, S38, S48, S58, S68, S78, S88, S98]),
	fd_all_different([S19, S29, S39, S49, S59, S69, S79, S89, S99]),

	fd_all_different([S11, S12, S13, S21, S22, S23, S31, S32, S33]),
	fd_all_different([S14, S15, S16, S24, S25, S26, S34, S35, S36]),
	fd_all_different([S17, S18, S19, S27, S28, S29, S37, S38, S39]),
	fd_all_different([S41, S42, S43, S51, S52, S53, S61, S62, S63]),
	fd_all_different([S44, S45, S46, S54, S55, S56, S64, S65, S66]),
	fd_all_different([S47, S48, S49, S57, S58, S59, S67, S68, S69]),
	fd_all_different([S71, S72, S73, S81, S82, S83, S91, S92, S93]),
	fd_all_different([S74, S75, S76, S84, S85, S86, S94, S95, S96]),
	fd_all_different([S77, S78, S79, S87, S88, S89, S97, S98, S99]),

/* Make the Sudoku solver print prettier solutions. */

	nl, write([S11, S12, S13, S14, S15, S16, S17, S18, S19]),
	nl, write([S21, S22, S23, S24, S25, S26, S27, S28, S29]),
	nl, write([S31, S32, S33, S34, S35, S36, S37, S38, S39]),
	nl, write([S41, S42, S43, S44, S45, S46, S47, S48, S49]),
	nl, write([S51, S52, S53, S54, S55, S56, S57, S58, S59]),
	nl, write([S61, S62, S63, S64, S65, S66, S67, S68, S69]),
	nl, write([S71, S72, S73, S74, S75, S76, S77, S78, S79]),
	nl, write([S81, S82, S83, S84, S85, S86, S87, S88, S89]),
	nl, write([S91, S92, S93, S94, S95, S96, S97, S98, S99]).