	.class public	p18csx
	.super java/lang/Object
	.method public static main([Ljava/lang/String;)V
	invokestatic	p18csx/main()V
	return
	.limit stack 2
	.end method
	.method public static	main()V
	ldc	"Testing Program p18csx\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	invokestatic	CSXLib/readInt()I
	istore	0
	invokestatic	CSXLib/readInt()I
	istore	1
	invokestatic	CSXLib/readInt()I
	istore	2
	iload	0
	ldc	-5
	if_icmpne	L6
	ldc	0
	goto	L7
L6:
	ldc	1
L7:
	ifne	L3
	iload	1
	ldc	-13
	if_icmpne	L8
	ldc	0
	goto	L9
L8:
	ldc	1
L9:
	ifeq	L4
L3:
	ldc	1
	goto	L5
L4:
	ldc	0
L5:
	ifne	L0
	iload	2
	ldc	20
	if_icmpne	L10
	ldc	0
	goto	L11
L10:
	ldc	1
L11:
	ifeq	L1
L0:
	ldc	1
	goto	L2
L1:
	ldc	0
L2:
	ifeq	L12
	ldc	"\nERROR: Read error\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	goto	L13
L12:
L13:
	ldc	1000
	istore	0
	ldc	2000
	istore	1
	ldc	3000
	istore	2
	ldc	"Testing print:  Ouput is "
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	0
	invokestatic	CSXLib/printInt(I)V
	iload	2
	invokestatic	CSXLib/printInt(I)V
	iload	1
	invokestatic	CSXLib/printInt(I)V
	ldc	"\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	"Test compeleted\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	return
	.limit stack 25
	.limit locals	3
	.end method
