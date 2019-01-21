	.class public	qsort
	.super java/lang/Object
	.method public static main([Ljava/lang/String;)V
	invokestatic	qsort/main()V
	return
	.limit stack 2
	.end method
	.method public static	qsort([III)V
	iload	1
	iload	2
	iadd
	ldc	2
	idiv
	istore	3
	iload	1
	iload	2
	if_icmpge	L0
	ldc	0
	goto	L1
L0:
	ldc	1
L1:
	ifeq	L2
	return
	goto	L3
L2:
L3:
	aload	0
	iload	3
	iaload
	istore	6
	iload	1
	istore	4
	iload	2
	istore	5
L4:
	iload	4
	iload	5
	if_icmple	L6
	ldc	0
	goto	L7
L6:
	ldc	1
L7:
	ifeq	L5
L8:
	aload	0
	iload	4
	iaload
	iload	6
	if_icmplt	L10
	ldc	0
	goto	L11
L10:
	ldc	1
L11:
	ifeq	L9
	iload	4
	ldc	1
	iadd
	istore	4
	goto	L8
L9:
L12:
	aload	0
	iload	5
	iaload
	iload	6
	if_icmpgt	L14
	ldc	0
	goto	L15
L14:
	ldc	1
L15:
	ifeq	L13
	iload	5
	ldc	1
	isub
	istore	5
	goto	L12
L13:
	iload	4
	iload	5
	if_icmple	L16
	ldc	0
	goto	L17
L16:
	ldc	1
L17:
	ifeq	L18
	aload	0
	iload	4
	iaload
	istore	7
	aload	0
	iload	4
	aload	0
	iload	5
	iaload
	iastore
	aload	0
	iload	5
	iload	7
	iastore
	iload	4
	ldc	1
	iadd
	istore	4
	iload	5
	ldc	1
	isub
	istore	5
	goto	L19
L18:
L19:
	goto	L4
L5:
	aload	0
	iload	1
	iload	5
	invokestatic	qsort/qsort([III)V
	aload	0
	iload	4
	iload	2
	invokestatic	qsort/qsort([III)V
	return
	.limit stack 25
	.limit locals	8
	.end method
	.method public static	main()V
	ldc	10000
	istore	0
	ldc	10000
	newarray int
	astore	1
	aload	1
	ldc	0
	ldc	97
	iastore
	ldc	1
	istore	2
L20:
	iload	2
	iload	0
	if_icmplt	L22
	ldc	0
	goto	L23
L22:
	ldc	1
L23:
	ifeq	L21
	aload	1
	iload	2
	ldc	1
	isub
	iaload
	ldc	32719
	imul
	ldc	997
	iadd
	istore	3
	iload	3
	iload	3
	ldc	16301
	idiv
	ldc	16301
	imul
	isub
	istore	3
	aload	1
	iload	2
	iload	3
	iastore
	aload	1
	iload	2
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	44
	invokestatic	CSXLib/printChar(C)V
	iload	2
	ldc	1
	iadd
	istore	2
	goto	L20
L21:
	ldc	10
	invokestatic	CSXLib/printChar(C)V
	aload	1
	ldc	0
	iload	0
	ldc	1
	isub
	invokestatic	qsort/qsort([III)V
	ldc	0
	istore	2
L24:
	iload	2
	iload	0
	if_icmplt	L26
	ldc	0
	goto	L27
L26:
	ldc	1
L27:
	ifeq	L25
	aload	1
	iload	2
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	44
	invokestatic	CSXLib/printChar(C)V
	iload	2
	ldc	1
	iadd
	istore	2
	goto	L24
L25:
	ldc	10
	invokestatic	CSXLib/printChar(C)V
	return
	.limit stack 25
	.limit locals	4
	.end method
