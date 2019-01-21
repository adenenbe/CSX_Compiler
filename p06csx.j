	.class public	p06csx
	.super java/lang/Object
	.method public static main([Ljava/lang/String;)V
	invokestatic	p06csx/main()V
	return
	.limit stack 2
	.end method
	.method public static	main()V
	ldc	"Testing program p06csx\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	1
	ifeq	L0
	ldc	"if then stmt works\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	goto	L1
L0:
L1:
	ldc	0
	ifeq	L2
	ldc	"if then stmt DOESN'T work\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	goto	L3
L2:
L3:
	ldc	1
	ifeq	L4
	ldc	"if then else stmt works\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	goto	L5
L4:
	ldc	"if then else stmt DOESN'T work\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
L5:
	ldc	0
	ifeq	L6
	ldc	"if then else stmt DOESN'T work\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	goto	L7
L6:
	ldc	"if then else stmt works\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
L7:
	return
	.limit stack 25
	.limit locals	0
	.end method
