	.class public	p39csx
	.super java/lang/Object
	.field public static	i$  [I
	.method public static main([Ljava/lang/String;)V
	ldc	10
	newarray int
	putstatic	p39csx/i$  [I
	invokestatic	p39csx/main()V
	return
	.limit stack 2
	.end method
	.method public static	sortup([I)V
	ldc	8
	istore	2
L0:
	iload	2
	ldc	0
	if_icmpge	L2
	ldc	0
	goto	L3
L2:
	ldc	1
L3:
	ifeq	L1
	ldc	0
	istore	1
L4:
	iload	1
	iload	2
	if_icmple	L6
	ldc	0
	goto	L7
L6:
	ldc	1
L7:
	ifeq	L5
	aload	0
	iload	1
	iaload
	aload	0
	iload	1
	ldc	1
	iadd
	iaload
	if_icmpgt	L8
	ldc	0
	goto	L9
L8:
	ldc	1
L9:
	ifeq	L10
	aload	0
	iload	1
	iaload
	istore	3
	aload	0
	iload	1
	aload	0
	iload	1
	ldc	1
	iadd
	iaload
	iastore
	aload	0
	iload	1
	ldc	1
	iadd
	iload	3
	iastore
	goto	L11
L10:
L11:
	iload	1
	ldc	1
	iadd
	istore	1
	goto	L4
L5:
	iload	2
	ldc	1
	isub
	istore	2
	goto	L0
L1:
	return
	.limit stack 25
	.limit locals	4
	.end method
	.method public static	sortdown([I)V
	ldc	8
	istore	2
L12:
	iload	2
	ldc	0
	if_icmpge	L14
	ldc	0
	goto	L15
L14:
	ldc	1
L15:
	ifeq	L13
	ldc	0
	istore	1
L16:
	iload	1
	iload	2
	if_icmple	L18
	ldc	0
	goto	L19
L18:
	ldc	1
L19:
	ifeq	L17
	aload	0
	iload	1
	iaload
	aload	0
	iload	1
	ldc	1
	iadd
	iaload
	if_icmplt	L20
	ldc	0
	goto	L21
L20:
	ldc	1
L21:
	ifeq	L22
	aload	0
	iload	1
	iaload
	istore	3
	aload	0
	iload	1
	aload	0
	iload	1
	ldc	1
	iadd
	iaload
	iastore
	aload	0
	iload	1
	ldc	1
	iadd
	iload	3
	iastore
	goto	L23
L22:
L23:
	iload	1
	ldc	1
	iadd
	istore	1
	goto	L16
L17:
	iload	2
	ldc	1
	isub
	istore	2
	goto	L12
L13:
	return
	.limit stack 25
	.limit locals	4
	.end method
	.method public static	main()V
	ldc	"Testing program p39csx\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	0
	ldc	1
	iastore
	getstatic	p39csx/i$  [I
	ldc	1
	ldc	-10
	iastore
	getstatic	p39csx/i$  [I
	ldc	2
	ldc	100
	iastore
	getstatic	p39csx/i$  [I
	ldc	3
	ldc	-1000
	iastore
	getstatic	p39csx/i$  [I
	ldc	4
	ldc	10000
	iastore
	getstatic	p39csx/i$  [I
	ldc	5
	ldc	-100000
	iastore
	getstatic	p39csx/i$  [I
	ldc	6
	ldc	1000000
	iastore
	getstatic	p39csx/i$  [I
	ldc	7
	ldc	-10000000
	iastore
	getstatic	p39csx/i$  [I
	ldc	8
	ldc	100000000
	iastore
	getstatic	p39csx/i$  [I
	ldc	9
	ldc	-1000000000
	iastore
	getstatic	p39csx/i$  [I
	invokestatic	p39csx/sortup([I)V
	ldc	"Sorted values (ascending order) are:\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	0
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	1
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	2
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	3
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	4
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	5
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	6
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	7
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	8
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	9
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	invokestatic	p39csx/sortdown([I)V
	ldc	"Sorted values (descending order) are:\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	0
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	1
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	2
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	3
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	4
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	5
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	6
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	7
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	8
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\t"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p39csx/i$  [I
	ldc	9
	iaload
	invokestatic	CSXLib/printInt(I)V
	ldc	"\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	return
	.limit stack 25
	.limit locals	0
	.end method
