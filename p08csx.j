	.class public	p08csx
	.super java/lang/Object
	.method public static main([Ljava/lang/String;)V
	invokestatic	p08csx/main()V
	return
	.limit stack 2
	.end method
	.method public static	main()V
	ldc	"Testing program p08csx\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	1
	istore	0
	ldc	0
	istore	1
	iload	0
	ifeq	L1
	iload	0
	ifeq	L1
L0:
	ldc	1
	goto	L2
L1:
	ldc	0
L2:
	istore	2
	iload	1
	ifeq	L4
	iload	1
	ifeq	L4
L3:
	ldc	1
	goto	L5
L4:
	ldc	0
L5:
	istore	3
	iload	0
	ifeq	L7
	iload	1
	ifeq	L7
L6:
	ldc	1
	goto	L8
L7:
	ldc	0
L8:
	istore	4
	iload	1
	ifeq	L10
	iload	0
	ifeq	L10
L9:
	ldc	1
	goto	L11
L10:
	ldc	0
L11:
	istore	5
	iload	0
	invokestatic	CSXLib/printBool(Z)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	1
	invokestatic	CSXLib/printBool(Z)V
	ldc	"\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	2
	invokestatic	CSXLib/printBool(Z)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	3
	invokestatic	CSXLib/printBool(Z)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	4
	invokestatic	CSXLib/printBool(Z)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	5
	invokestatic	CSXLib/printBool(Z)V
	ldc	"\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	0
	ifne	L12
	iload	0
	ifeq	L13
L12:
	ldc	1
	goto	L14
L13:
	ldc	0
L14:
	istore	2
	iload	1
	ifne	L15
	iload	1
	ifeq	L16
L15:
	ldc	1
	goto	L17
L16:
	ldc	0
L17:
	istore	3
	iload	0
	ifne	L18
	iload	1
	ifeq	L19
L18:
	ldc	1
	goto	L20
L19:
	ldc	0
L20:
	istore	4
	iload	1
	ifne	L21
	iload	0
	ifeq	L22
L21:
	ldc	1
	goto	L23
L22:
	ldc	0
L23:
	istore	5
	iload	0
	invokestatic	CSXLib/printBool(Z)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	1
	invokestatic	CSXLib/printBool(Z)V
	ldc	"\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	2
	invokestatic	CSXLib/printBool(Z)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	3
	invokestatic	CSXLib/printBool(Z)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	4
	invokestatic	CSXLib/printBool(Z)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	5
	invokestatic	CSXLib/printBool(Z)V
	ldc	"\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	0
	ifeq	L24
	ldc	0
	goto	L25
L24:
	ldc	1
L25:
	istore	2
	iload	1
	ifeq	L26
	ldc	0
	goto	L27
L26:
	ldc	1
L27:
	istore	3
	iload	0
	invokestatic	CSXLib/printBool(Z)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	1
	invokestatic	CSXLib/printBool(Z)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	2
	invokestatic	CSXLib/printBool(Z)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	3
	invokestatic	CSXLib/printBool(Z)V
	ldc	"\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	return
	.limit stack 25
	.limit locals	8
	.end method
