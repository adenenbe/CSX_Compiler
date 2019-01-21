	.class public	p23csx
	.super java/lang/Object
	.method public static main([Ljava/lang/String;)V
	invokestatic	p23csx/main()V
	return
	.limit stack 2
	.end method
	.method public static	main()V
	ldc	"Testing Program p23csx\n"
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
	ldc	"ERROR: Less Than operator not working"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	0
	istore	2
L6:
	iload	0
	iload	1
	if_icmple	L19
	ldc	0
	goto	L20
L19:
	ldc	1
L20:
	ifeq	L17
	iload	0
	ldc	1
	if_icmple	L21
	ldc	0
	goto	L22
L21:
	ldc	1
L22:
	ifeq	L17
L16:
	ldc	1
	goto	L18
L17:
	ldc	0
L18:
	ifeq	L14
	iload	1
	ldc	2
	if_icmple	L23
	ldc	0
	goto	L24
L23:
	ldc	1
L24:
	ifeq	L14
L13:
	ldc	1
	goto	L15
L14:
	ldc	0
L15:
	ifeq	L11
	iload	0
	ldc	1000000
	if_icmple	L25
	ldc	0
	goto	L26
L25:
	ldc	1
L26:
	ifeq	L11
L10:
	ldc	1
	goto	L12
L11:
	ldc	0
L12:
	ifeq	L8
	ldc	-123456
	ldc	123456
	if_icmple	L27
	ldc	0
	goto	L28
L27:
	ldc	1
L28:
	ifeq	L8
L7:
	ldc	1
	goto	L9
L8:
	ldc	0
L9:
	ifeq	L29
	iload	2
	ifeq	L31
	ldc	1
	ifeq	L31
L30:
	ldc	1
	goto	L32
L31:
	ldc	0
L32:
	istore	2
	goto	L33
L29:
	ldc	"ERROR: <= operator not working"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	0
	istore	2
L33:
	iload	1
	iload	0
	if_icmpgt	L34
	ldc	0
	goto	L35
L34:
	ldc	1
L35:
	ifeq	L36
	iload	2
	ifeq	L38
	ldc	1
	ifeq	L38
L37:
	ldc	1
	goto	L39
L38:
	ldc	0
L39:
	istore	2
	goto	L40
L36:
	ldc	"ERROR: Greater Than operator not working"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	0
	istore	2
L40:
	iload	1
	iload	0
	if_icmpge	L53
	ldc	0
	goto	L54
L53:
	ldc	1
L54:
	ifeq	L51
	iload	1
	ldc	2
	if_icmpge	L55
	ldc	0
	goto	L56
L55:
	ldc	1
L56:
	ifeq	L51
L50:
	ldc	1
	goto	L52
L51:
	ldc	0
L52:
	ifeq	L48
	ldc	1
	iload	0
	if_icmpge	L57
	ldc	0
	goto	L58
L57:
	ldc	1
L58:
	ifeq	L48
L47:
	ldc	1
	goto	L49
L48:
	ldc	0
L49:
	ifeq	L45
	iload	1
	ldc	-123456
	if_icmpge	L59
	ldc	0
	goto	L60
L59:
	ldc	1
L60:
	ifeq	L45
L44:
	ldc	1
	goto	L46
L45:
	ldc	0
L46:
	ifeq	L42
	ldc	0
	ldc	-111111
	if_icmpge	L61
	ldc	0
	goto	L62
L61:
	ldc	1
L62:
	ifeq	L42
L41:
	ldc	1
	goto	L43
L42:
	ldc	0
L43:
	ifeq	L63
	iload	2
	ifeq	L65
	ldc	1
	ifeq	L65
L64:
	ldc	1
	goto	L66
L65:
	ldc	0
L66:
	istore	2
	goto	L67
L63:
	ldc	"ERROR: >= operator not working"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	0
	istore	2
L67:
	iload	0
	iload	1
	if_icmpeq	L68
	ldc	0
	goto	L69
L68:
	ldc	1
L69:
	ifeq	L70
	ldc	"ERROR: Equal operator not working"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	0
	istore	2
	goto	L71
L70:
	iload	2
	ifeq	L73
	ldc	1
	ifeq	L73
L72:
	ldc	1
	goto	L74
L73:
	ldc	0
L74:
	istore	2
L71:
	iload	0
	iload	1
	if_icmpne	L75
	ldc	0
	goto	L76
L75:
	ldc	1
L76:
	ifeq	L77
	iload	2
	ifeq	L79
	ldc	1
	ifeq	L79
L78:
	ldc	1
	goto	L80
L79:
	ldc	0
L80:
	istore	2
	goto	L81
L77:
	ldc	"ERROR: Less Than operator not working"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	0
	istore	2
L81:
	iload	2
	ldc	0
	if_icmpeq	L82
	ldc	0
	goto	L83
L82:
	ldc	1
L83:
	ifeq	L84
	ldc	"ERRORS found in program"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	goto	L85
L84:
L85:
	ldc	"Test compeleted\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	return
	.limit stack 25
	.limit locals	3
	.end method
