	.class public	p20csx
	.super java/lang/Object
	.method public static main([Ljava/lang/String;)V
	invokestatic	p20csx/main()V
	return
	.limit stack 2
	.end method
	.method public static	main()V
	ldc	"Testing Program p20csx\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	1
	istore	0
	ldc	2
	istore	1
	ldc	1
	istore	2
	iload	0
	iload	1
	if_icmplt	L0
	ldc	0
	goto	L1
L0:
	ldc	1
L1:
	ifeq	L2
	iload	2
	ifeq	L4
	ldc	1
	ifeq	L4
L3:
	ldc	1
	goto	L5
L4:
	ldc	0
L5:
	istore	2
	goto	L6
L2:
	ldc	"ERROR: Less Than operator not working\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	0
	istore	2
L6:
	iload	1
	iload	0
	if_icmpgt	L7
	ldc	0
	goto	L8
L7:
	ldc	1
L8:
	ifeq	L9
	iload	2
	ifeq	L11
	ldc	1
	ifeq	L11
L10:
	ldc	1
	goto	L12
L11:
	ldc	0
L12:
	istore	2
	goto	L13
L9:
	ldc	"ERROR: Greater Than operator not working\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	0
	istore	2
L13:
	iload	0
	iload	1
	if_icmpeq	L14
	ldc	0
	goto	L15
L14:
	ldc	1
L15:
	ifeq	L16
	ldc	"ERROR: Equal operator not working\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	0
	istore	2
	goto	L17
L16:
	iload	2
	ifeq	L19
	ldc	1
	ifeq	L19
L18:
	ldc	1
	goto	L20
L19:
	ldc	0
L20:
	istore	2
L17:
	iload	0
	iload	1
	if_icmpne	L21
	ldc	0
	goto	L22
L21:
	ldc	1
L22:
	ifeq	L23
	iload	2
	ifeq	L25
	ldc	1
	ifeq	L25
L24:
	ldc	1
	goto	L26
L25:
	ldc	0
L26:
	istore	2
	goto	L27
L23:
	ldc	"ERROR: Less Than operator not working\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	0
	istore	2
L27:
	iload	2
	ldc	0
	if_icmpeq	L28
	ldc	0
	goto	L29
L28:
	ldc	1
L29:
	ifeq	L30
	ldc	"ERRORS found in program\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	goto	L31
L30:
L31:
	ldc	"Test compeleted\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	return
	.limit stack 25
	.limit locals	3
	.end method
