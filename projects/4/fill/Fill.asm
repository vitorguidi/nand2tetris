// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

@KBD
D=M
@WRITE
D;JGT
@CLEAR
D;JEQ

(WRITE)
    @R1
    M=-1
    @DRAW
    0;JMP

(CLEAR)
    @R1
    M=0
    @DRAW
    0;JMP

(DRAW)
    @SCREEN
    D=A
    @R2     //pixel to be painted
    M=D

    @8192   //number of iterations left
    D=A  
    @R3
    M=D

    @STEP
    0;JMP

(STEP)
    @R1
    D=M //pixel value
    @R2
    A=M
    M=D

    @R2
    M=M+1
    @R3
    M=M-1

    D=M
    @STEP
    D;JGT

(LOOP)
    @LOOP
    0;JMP