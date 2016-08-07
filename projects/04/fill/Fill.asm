// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(LOOP)
	// Loading base address into R3
	@16384
	D = A
	@3
	M = D
	// Loading keyboard address
	@24576
	D = M
	@SET0
	D;JLE
	@32767
	D = A
	@7
	M = D
	@SET_SCREEN
	0;JMP
	(SET0)
		@0
		D = A
		@7
		M = D
		@SET_SCREEN
		0;JMP
	(SET_SCREEN)
	// Initializing 32 and 256 into R0 and R1
		@32
		D = A
		@0
		M = D
		@256
		D = A
		@1
		M = D
		@MUL
		0;JMP
		
		(MUL)
			@2
			M = 0
			(MUL_LOOP)
				@0
				D = M
				@SCREEN_PRINT
				D;JLE
				@2
				D = M
				@1
				D = D + M
				@2
				M = D
				@0
				D = M
				@1
				D = D - A
				@0
				M = D
				@MUL_LOOP
				0;JMP
		(SCREEN_PRINT)
			// Decrementing multiplication count by 1
			@2
			D = M
			@1
			D = D - A
			@2
			M = D
			@LOOP
			D;JLT
			@3
			D = D + M
			@4
			M = D
			@7
			D = M
			@4
			A = M
			M = D
			@SCREEN_PRINT
			0;JMP