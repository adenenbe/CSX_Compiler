	.class public	test49
	.super java/lang/Object
	.method public static main([Ljava/lang/String;)V
	invokestatic	test49/main()V
	return
	.limit stack 2
	.end method
	.method public static	test(III)V
	iload	0
	iload	1
	if_icmpne	L0
	ldc	0
	goto	L1
L0:
	ldc	1
L1:
	ifeq	L2
	ldc	"Run-time error at line "
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	2
	invokestatic	CSXLib/printInt(I)V
	goto	L3
L2:
L3:
	return
	.limit stack 25
	.limit locals	3
	.end method
	.method public static	test(CCI)V
	iload	0
	iload	1
	iload	2
	invokestatic	test49/test(III)V
	return
	.limit stack 25
	.limit locals	3
	.end method
	.method public static	test(ZZI)V
	iload	0
	iload	1
	iload	2
	invokestatic	test49/test(III)V
	return
	.limit stack 25
	.limit locals	3
	.end method
	.method public static	kaboom()Z
	ldc	"Error in short-circuit evaluation of && or !!.\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	0
	ldc	1
	ldc	0
	idiv
	if_icmpeq	L4
	ldc	0
	goto	L5
L4:
	ldc	1
L5:
	ireturn
	ldc	0
	ireturn
	.limit stack 25
	.limit locals	0
	.end method
	.method public static	main()V
	ldc	1
	istore	0
	ldc	0
	istore	1
	ldc	0
	istore	2
	ldc	255
	istore	3
	ldc	"Start test of binary operators.\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	0
	ldc	-1
	ixor
	ldc	0
	ldc	1
	isub
	ldc	26
	invokestatic	test49/test(III)V
	ldc	255
	ldc	-1
	ixor
	ldc	-256
	ldc	27
	invokestatic	test49/test(III)V
	ldc	64
	ldc	127
	ixor
	ldc	127
	iand
	ldc	63
	ldc	28
	invokestatic	test49/test(CCI)V
	ldc	1
	ldc	0
	iand
	ldc	0
	ldc	29
	invokestatic	test49/test(ZZI)V
	ldc	0
	ldc	1
	ior
	ldc	1
	ldc	30
	invokestatic	test49/test(ZZI)V
	iload	0
	iload	0
	iand
	ldc	1
	ldc	32
	invokestatic	test49/test(ZZI)V
	iload	0
	iload	1
	iand
	ldc	0
	ldc	33
	invokestatic	test49/test(ZZI)V
	iload	1
	iload	0
	iand
	ldc	0
	ldc	34
	invokestatic	test49/test(ZZI)V
	iload	1
	iload	1
	iand
	ldc	0
	ldc	35
	invokestatic	test49/test(ZZI)V
	iload	0
	iload	0
	ior
	ldc	1
	ldc	36
	invokestatic	test49/test(ZZI)V
	iload	0
	iload	1
	ior
	ldc	1
	ldc	37
	invokestatic	test49/test(ZZI)V
	iload	1
	iload	0
	ior
	ldc	1
	ldc	38
	invokestatic	test49/test(ZZI)V
	iload	1
	iload	1
	ior
	ldc	0
	ldc	39
	invokestatic	test49/test(ZZI)V
	iload	0
	ifeq	L7
	iload	0
	ifeq	L7
L6:
	ldc	1
	goto	L8
L7:
	ldc	0
L8:
	ldc	1
	ldc	40
	invokestatic	test49/test(ZZI)V
	iload	0
	ifeq	L10
	iload	1
	ifeq	L10
L9:
	ldc	1
	goto	L11
L10:
	ldc	0
L11:
	ldc	0
	ldc	41
	invokestatic	test49/test(ZZI)V
	iload	1
	ifeq	L13
	iload	0
	ifeq	L13
L12:
	ldc	1
	goto	L14
L13:
	ldc	0
L14:
	ldc	0
	ldc	42
	invokestatic	test49/test(ZZI)V
	iload	1
	ifeq	L16
	iload	1
	ifeq	L16
L15:
	ldc	1
	goto	L17
L16:
	ldc	0
L17:
	ldc	0
	ldc	43
	invokestatic	test49/test(ZZI)V
	iload	0
	ifne	L18
	iload	0
	ifeq	L19
L18:
	ldc	1
	goto	L20
L19:
	ldc	0
L20:
	ldc	1
	ldc	44
	invokestatic	test49/test(ZZI)V
	iload	0
	ifne	L21
	iload	1
	ifeq	L22
L21:
	ldc	1
	goto	L23
L22:
	ldc	0
L23:
	ldc	1
	ldc	45
	invokestatic	test49/test(ZZI)V
	iload	1
	ifne	L24
	iload	0
	ifeq	L25
L24:
	ldc	1
	goto	L26
L25:
	ldc	0
L26:
	ldc	1
	ldc	46
	invokestatic	test49/test(ZZI)V
	iload	1
	ifne	L27
	iload	1
	ifeq	L28
L27:
	ldc	1
	goto	L29
L28:
	ldc	0
L29:
	ldc	0
	ldc	47
	invokestatic	test49/test(ZZI)V
	iload	1
	ifeq	L31
	invokestatic	test49/kaboom()Z
	ifeq	L31
L30:
	ldc	1
	goto	L32
L31:
	ldc	0
L32:
	ldc	0
	ldc	54
	invokestatic	test49/test(ZZI)V
	iload	0
	ifne	L33
	invokestatic	test49/kaboom()Z
	ifeq	L34
L33:
	ldc	1
	goto	L35
L34:
	ldc	0
L35:
	ldc	1
	ldc	55
	invokestatic	test49/test(ZZI)V
	ldc	"Test of binary operators completed.\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	return
	.limit stack 25
	.limit locals	4
	.end method
