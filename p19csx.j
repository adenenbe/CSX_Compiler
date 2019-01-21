	.class public	p19csx
	.super java/lang/Object
	.method public static main([Ljava/lang/String;)V
	invokestatic	p19csx/main()V
	return
	.limit stack 2
	.end method
	.method public static	main()V
	ldc	1
	istore	0
	ldc	9
	istore	1
	ldc	1
	istore	2
	ldc	0
	istore	3
	ldc	"Testing Program p19csx\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	1
	istore	4
	ldc	9
	istore	5
	ldc	1
	istore	6
	ldc	0
	istore	7
	ldc	0
	istore	8
	iload	3
	ifeq	L0
	ldc	"\n====> Wrong Control Flow 1\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	goto	L1
L0:
	iload	7
	ifne	L2
	iload	6
	ifeq	L3
L2:
	ldc	1
	goto	L4
L3:
	ldc	0
L4:
	ifeq	L5
	iload	8
	ldc	1
	iadd
	istore	8
	iload	7
	iload	4
	ldc	1
	if_icmpne	L6
	ldc	0
	goto	L7
L6:
	ldc	1
L7:
	if_icmpne	L8
	ldc	0
	goto	L9
L8:
	ldc	1
L9:
	ifeq	L10
	ldc	"===> Wrong Control Flow 2\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	20
	ldc	10
	if_icmpgt	L11
	ldc	0
	goto	L12
L11:
	ldc	1
L12:
	ifeq	L13
	iload	3
	ifeq	L15
	iload	4
	ldc	0
	if_icmpne	L17
	ldc	0
	goto	L18
L17:
	ldc	1
L18:
	ifeq	L15
L14:
	ldc	1
	goto	L16
L15:
	ldc	0
L16:
	ifeq	L19
	ldc	"\n ==> Wrong Control Flow 3\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	goto	L20
L19:
	iload	5
	iload	0
	iload	4
	isub
	if_icmplt	L21
	ldc	0
	goto	L22
L21:
	ldc	1
L22:
	ifeq	L23
	ldc	"\n===> Wrong Control Flow 4\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	goto	L24
L23:
L24:
L20:
	goto	L25
L13:
	ldc	"\n===> Wrong Control Flow 5\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
L25:
	goto	L26
L10:
	ldc	1
	ifeq	L27
	iload	5
	ldc	9
	if_icmpeq	L31
	ldc	0
	goto	L32
L31:
	ldc	1
L32:
	ifeq	L29
	iload	3
	ldc	1
	if_icmpne	L33
	ldc	0
	goto	L34
L33:
	ldc	1
L34:
	ifeq	L29
L28:
	ldc	1
	goto	L30
L29:
	ldc	0
L30:
	ifeq	L35
	iload	8
	ldc	1
	iadd
	istore	8
	goto	L36
L35:
	ldc	"\n===> Wrong Flow Control 6\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
L36:
	goto	L37
L27:
	ldc	"\n==> Wrong Flow Control 7\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
L37:
L26:
	goto	L38
L5:
L38:
L1:
	iload	8
	ldc	2
	if_icmpne	L39
	ldc	0
	goto	L40
L39:
	ldc	1
L40:
	ifeq	L41
	ldc	"\n ERROR : Incorrect paths followed \n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	goto	L42
L41:
L42:
	ldc	"Test compeleted\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	return
	.limit stack 25
	.limit locals	9
	.end method
