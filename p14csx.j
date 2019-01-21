	.class public	p14csx
	.super java/lang/Object
	.method public static main([Ljava/lang/String;)V
	invokestatic	p14csx/main()V
	return
	.limit stack 2
	.end method
	.method public static	main()V
	ldc	"Testing program p14csx\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	-2147483640
	istore	0
	ldc	2147483647
	istore	1
	iload	0
	iload	1
	if_icmpgt	L9
	ldc	0
	goto	L10
L9:
	ldc	1
L10:
	ifne	L6
	iload	0
	iload	1
	if_icmpeq	L11
	ldc	0
	goto	L12
L11:
	ldc	1
L12:
	ifeq	L7
L6:
	ldc	1
	goto	L8
L7:
	ldc	0
L8:
	ifne	L3
	iload	1
	iload	0
	if_icmplt	L13
	ldc	0
	goto	L14
L13:
	ldc	1
L14:
	ifeq	L4
L3:
	ldc	1
	goto	L5
L4:
	ldc	0
L5:
	ifne	L0
	iload	1
	iload	1
	if_icmpne	L15
	ldc	0
	goto	L16
L15:
	ldc	1
L16:
	ifeq	L1
L0:
	ldc	1
	goto	L2
L1:
	ldc	0
L2:
	ifeq	L17
	ldc	"ERROR: Error in relational operators (integer)\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	goto	L18
L17:
L18:
	iload	0
	ldc	0
	imul
	istore	0
	iload	1
	ldc	1
	imul
	istore	1
	ldc	0
	istore	2
	ldc	1
	istore	3
	iload	2
	ldc	1
	if_icmpeq	L22
	ldc	0
	goto	L23
L22:
	ldc	1
L23:
	ifeq	L20
	iload	3
	iload	2
	if_icmpeq	L24
	ldc	0
	goto	L25
L24:
	ldc	1
L25:
	ifeq	L20
L19:
	ldc	1
	goto	L21
L20:
	ldc	0
L21:
	istore	3
	iload	3
	ifeq	L26
	ldc	"ERROR: In boolean expression\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	goto	L27
L26:
L27:
	iload	0
	iload	1
	if_icmplt	L34
	ldc	0
	goto	L35
L34:
	ldc	1
L35:
	ifeq	L32
	iload	0
	ldc	0
	if_icmpeq	L36
	ldc	0
	goto	L37
L36:
	ldc	1
L37:
	ifeq	L32
L31:
	ldc	1
	goto	L33
L32:
	ldc	0
L33:
	ifeq	L29
	ldc	0
	ifeq	L29
L28:
	ldc	1
	goto	L30
L29:
	ldc	0
L30:
	istore	2
	iload	2
	ifeq	L38
	ldc	"ERROR: In boolean/integer expression\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	goto	L39
L38:
L39:
	ldc	1
	ldc	2
	iadd
	ldc	3
	imul
	ldc	4
	ldc	5
	iadd
	idiv
	istore	0
	ldc	1
	ldc	2
	iadd
	ldc	3
	ldc	4
	ldc	5
	iadd
	idiv
	imul
	istore	1
	ldc	"hi"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	iload	0
	ldc	1
	if_icmpne	L43
	ldc	0
	goto	L44
L43:
	ldc	1
L44:
	ifne	L40
	iload	1
	ldc	0
	if_icmpne	L45
	ldc	0
	goto	L46
L45:
	ldc	1
L46:
	ifeq	L41
L40:
	ldc	1
	goto	L42
L41:
	ldc	0
L42:
	ifeq	L47
	ldc	"ERROR: Improper Integer division and associativity\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	goto	L48
L47:
L48:
	ldc	"\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	return
	.limit stack 25
	.limit locals	4
	.end method
