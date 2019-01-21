	.class public	p38csx
	.super java/lang/Object
	.field public static	dim$ I =  8
	.field public static	a1$ I =  1
	.field public static	b1$ I =  2
	.field public static	c1$ I =  3
	.field public static	d1$ I =  4
	.field public static	e1$ I =  5
	.field public static	f1$ I =  6
	.field public static	g1$ I =  7
	.field public static	h1$ I =  8
	.field public static	a2$  I
	.field public static	b2$  I
	.field public static	c2$  I
	.field public static	d2$  I
	.field public static	e2$  I
	.field public static	f2$  I
	.field public static	g2$  I
	.field public static	h2$  I
	.field public static	count$ I =  0
	.field public static	flag1$  I
	.field public static	flag2$  I
	.field public static	flag3$  I
	.field public static	flag4$  I
	.field public static	flag5$  I
	.field public static	flag6$  I
	.field public static	flag7$  I
	.method public static main([Ljava/lang/String;)V
	invokestatic	p38csx/main()V
	return
	.limit stack 2
	.end method
	.method public static	compatible(IIII)Z
	iload	1
	iload	3
	if_icmpeq	L0
	ldc	0
	goto	L1
L0:
	ldc	1
L1:
	ifeq	L2
	ldc	0
	ireturn
	goto	L3
L2:
L3:
	iload	3
	iload	1
	isub
	iload	2
	iload	0
	isub
	if_icmpeq	L7
	ldc	0
	goto	L8
L7:
	ldc	1
L8:
	ifne	L4
	iload	1
	iload	3
	isub
	iload	2
	iload	0
	isub
	if_icmpeq	L9
	ldc	0
	goto	L10
L9:
	ldc	1
L10:
	ifeq	L5
L4:
	ldc	1
	goto	L6
L5:
	ldc	0
L6:
	ifeq	L11
	ldc	0
	ireturn
	goto	L12
L11:
	ldc	1
	ireturn
L12:
	ldc	0
	ireturn
	.limit stack 25
	.limit locals	4
	.end method
	.method public static	main()V
	ldc	"Testing Program p38csx (8 queens problem)"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	"\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	1
	putstatic	p38csx/a2$  I
	ldc	1
	putstatic	p38csx/b2$  I
	ldc	1
	putstatic	p38csx/c2$  I
	ldc	1
	putstatic	p38csx/d2$  I
	ldc	1
	putstatic	p38csx/e2$  I
	ldc	1
	putstatic	p38csx/f2$  I
	ldc	1
	putstatic	p38csx/g2$  I
	ldc	1
	putstatic	p38csx/h2$  I
L13:
	getstatic	p38csx/a2$  I
	ldc	8
	if_icmple	L15
	ldc	0
	goto	L16
L15:
	ldc	1
L16:
	ifeq	L14
L17:
	getstatic	p38csx/b2$  I
	ldc	8
	if_icmple	L19
	ldc	0
	goto	L20
L19:
	ldc	1
L20:
	ifeq	L18
	getstatic	p38csx/a1$  I
	getstatic	p38csx/a2$  I
	getstatic	p38csx/b1$  I
	getstatic	p38csx/b2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag1$  I
	getstatic	p38csx/flag1$  I
	ifeq	L21
L22:
	getstatic	p38csx/c2$  I
	ldc	8
	if_icmple	L24
	ldc	0
	goto	L25
L24:
	ldc	1
L25:
	ifeq	L23
	getstatic	p38csx/a1$  I
	getstatic	p38csx/a2$  I
	getstatic	p38csx/c1$  I
	getstatic	p38csx/c2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag1$  I
	getstatic	p38csx/b1$  I
	getstatic	p38csx/b2$  I
	getstatic	p38csx/c1$  I
	getstatic	p38csx/c2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag2$  I
	getstatic	p38csx/flag1$  I
	ifeq	L27
	getstatic	p38csx/flag2$  I
	ifeq	L27
L26:
	ldc	1
	goto	L28
L27:
	ldc	0
L28:
	ifeq	L29
L30:
	getstatic	p38csx/d2$  I
	ldc	8
	if_icmple	L32
	ldc	0
	goto	L33
L32:
	ldc	1
L33:
	ifeq	L31
	getstatic	p38csx/a1$  I
	getstatic	p38csx/a2$  I
	getstatic	p38csx/d1$  I
	getstatic	p38csx/d2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag1$  I
	getstatic	p38csx/b1$  I
	getstatic	p38csx/b2$  I
	getstatic	p38csx/d1$  I
	getstatic	p38csx/d2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag2$  I
	getstatic	p38csx/c1$  I
	getstatic	p38csx/c2$  I
	getstatic	p38csx/d1$  I
	getstatic	p38csx/d2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag3$  I
	getstatic	p38csx/flag1$  I
	ifeq	L38
	getstatic	p38csx/flag2$  I
	ifeq	L38
L37:
	ldc	1
	goto	L39
L38:
	ldc	0
L39:
	ifeq	L35
	getstatic	p38csx/flag3$  I
	ifeq	L35
L34:
	ldc	1
	goto	L36
L35:
	ldc	0
L36:
	ifeq	L40
L41:
	getstatic	p38csx/e2$  I
	ldc	8
	if_icmple	L43
	ldc	0
	goto	L44
L43:
	ldc	1
L44:
	ifeq	L42
	getstatic	p38csx/a1$  I
	getstatic	p38csx/a2$  I
	getstatic	p38csx/e1$  I
	getstatic	p38csx/e2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag1$  I
	getstatic	p38csx/b1$  I
	getstatic	p38csx/b2$  I
	getstatic	p38csx/e1$  I
	getstatic	p38csx/e2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag2$  I
	getstatic	p38csx/c1$  I
	getstatic	p38csx/c2$  I
	getstatic	p38csx/e1$  I
	getstatic	p38csx/e2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag3$  I
	getstatic	p38csx/d1$  I
	getstatic	p38csx/d2$  I
	getstatic	p38csx/e1$  I
	getstatic	p38csx/e2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag4$  I
	getstatic	p38csx/flag1$  I
	ifeq	L52
	getstatic	p38csx/flag2$  I
	ifeq	L52
L51:
	ldc	1
	goto	L53
L52:
	ldc	0
L53:
	ifeq	L49
	getstatic	p38csx/flag3$  I
	ifeq	L49
L48:
	ldc	1
	goto	L50
L49:
	ldc	0
L50:
	ifeq	L46
	getstatic	p38csx/flag4$  I
	ifeq	L46
L45:
	ldc	1
	goto	L47
L46:
	ldc	0
L47:
	ifeq	L54
L55:
	getstatic	p38csx/f2$  I
	ldc	8
	if_icmple	L57
	ldc	0
	goto	L58
L57:
	ldc	1
L58:
	ifeq	L56
	getstatic	p38csx/a1$  I
	getstatic	p38csx/a2$  I
	getstatic	p38csx/f1$  I
	getstatic	p38csx/f2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag1$  I
	getstatic	p38csx/b1$  I
	getstatic	p38csx/b2$  I
	getstatic	p38csx/f1$  I
	getstatic	p38csx/f2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag2$  I
	getstatic	p38csx/c1$  I
	getstatic	p38csx/c2$  I
	getstatic	p38csx/f1$  I
	getstatic	p38csx/f2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag3$  I
	getstatic	p38csx/d1$  I
	getstatic	p38csx/d2$  I
	getstatic	p38csx/f1$  I
	getstatic	p38csx/f2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag4$  I
	getstatic	p38csx/e1$  I
	getstatic	p38csx/e2$  I
	getstatic	p38csx/f1$  I
	getstatic	p38csx/f2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag5$  I
	getstatic	p38csx/flag1$  I
	ifeq	L69
	getstatic	p38csx/flag2$  I
	ifeq	L69
L68:
	ldc	1
	goto	L70
L69:
	ldc	0
L70:
	ifeq	L66
	getstatic	p38csx/flag3$  I
	ifeq	L66
L65:
	ldc	1
	goto	L67
L66:
	ldc	0
L67:
	ifeq	L63
	getstatic	p38csx/flag4$  I
	ifeq	L63
L62:
	ldc	1
	goto	L64
L63:
	ldc	0
L64:
	ifeq	L60
	getstatic	p38csx/flag5$  I
	ifeq	L60
L59:
	ldc	1
	goto	L61
L60:
	ldc	0
L61:
	ifeq	L71
L72:
	getstatic	p38csx/g2$  I
	ldc	8
	if_icmple	L74
	ldc	0
	goto	L75
L74:
	ldc	1
L75:
	ifeq	L73
	getstatic	p38csx/a1$  I
	getstatic	p38csx/a2$  I
	getstatic	p38csx/g1$  I
	getstatic	p38csx/g2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag1$  I
	getstatic	p38csx/b1$  I
	getstatic	p38csx/b2$  I
	getstatic	p38csx/g1$  I
	getstatic	p38csx/g2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag2$  I
	getstatic	p38csx/c1$  I
	getstatic	p38csx/c2$  I
	getstatic	p38csx/g1$  I
	getstatic	p38csx/g2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag3$  I
	getstatic	p38csx/d1$  I
	getstatic	p38csx/d2$  I
	getstatic	p38csx/g1$  I
	getstatic	p38csx/g2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag4$  I
	getstatic	p38csx/e1$  I
	getstatic	p38csx/e2$  I
	getstatic	p38csx/g1$  I
	getstatic	p38csx/g2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag5$  I
	getstatic	p38csx/f1$  I
	getstatic	p38csx/f2$  I
	getstatic	p38csx/g1$  I
	getstatic	p38csx/g2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag6$  I
	getstatic	p38csx/flag1$  I
	ifeq	L89
	getstatic	p38csx/flag2$  I
	ifeq	L89
L88:
	ldc	1
	goto	L90
L89:
	ldc	0
L90:
	ifeq	L86
	getstatic	p38csx/flag3$  I
	ifeq	L86
L85:
	ldc	1
	goto	L87
L86:
	ldc	0
L87:
	ifeq	L83
	getstatic	p38csx/flag4$  I
	ifeq	L83
L82:
	ldc	1
	goto	L84
L83:
	ldc	0
L84:
	ifeq	L80
	getstatic	p38csx/flag5$  I
	ifeq	L80
L79:
	ldc	1
	goto	L81
L80:
	ldc	0
L81:
	ifeq	L77
	getstatic	p38csx/flag6$  I
	ifeq	L77
L76:
	ldc	1
	goto	L78
L77:
	ldc	0
L78:
	ifeq	L91
L92:
	getstatic	p38csx/h2$  I
	ldc	8
	if_icmple	L94
	ldc	0
	goto	L95
L94:
	ldc	1
L95:
	ifeq	L93
	getstatic	p38csx/a1$  I
	getstatic	p38csx/a2$  I
	getstatic	p38csx/h1$  I
	getstatic	p38csx/h2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag1$  I
	getstatic	p38csx/b1$  I
	getstatic	p38csx/b2$  I
	getstatic	p38csx/h1$  I
	getstatic	p38csx/h2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag2$  I
	getstatic	p38csx/c1$  I
	getstatic	p38csx/c2$  I
	getstatic	p38csx/h1$  I
	getstatic	p38csx/h2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag3$  I
	getstatic	p38csx/d1$  I
	getstatic	p38csx/d2$  I
	getstatic	p38csx/h1$  I
	getstatic	p38csx/h2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag4$  I
	getstatic	p38csx/e1$  I
	getstatic	p38csx/e2$  I
	getstatic	p38csx/h1$  I
	getstatic	p38csx/h2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag5$  I
	getstatic	p38csx/f1$  I
	getstatic	p38csx/f2$  I
	getstatic	p38csx/h1$  I
	getstatic	p38csx/h2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag6$  I
	getstatic	p38csx/g1$  I
	getstatic	p38csx/g2$  I
	getstatic	p38csx/h1$  I
	getstatic	p38csx/h2$  I
	invokestatic	p38csx/compatible(IIII)Z
	putstatic	p38csx/flag7$  I
	getstatic	p38csx/flag1$  I
	ifeq	L112
	getstatic	p38csx/flag2$  I
	ifeq	L112
L111:
	ldc	1
	goto	L113
L112:
	ldc	0
L113:
	ifeq	L109
	getstatic	p38csx/flag3$  I
	ifeq	L109
L108:
	ldc	1
	goto	L110
L109:
	ldc	0
L110:
	ifeq	L106
	getstatic	p38csx/flag4$  I
	ifeq	L106
L105:
	ldc	1
	goto	L107
L106:
	ldc	0
L107:
	ifeq	L103
	getstatic	p38csx/flag5$  I
	ifeq	L103
L102:
	ldc	1
	goto	L104
L103:
	ldc	0
L104:
	ifeq	L100
	getstatic	p38csx/flag6$  I
	ifeq	L100
L99:
	ldc	1
	goto	L101
L100:
	ldc	0
L101:
	ifeq	L97
	getstatic	p38csx/flag7$  I
	ifeq	L97
L96:
	ldc	1
	goto	L98
L97:
	ldc	0
L98:
	ifeq	L114
	getstatic	p38csx/count$  I
	ldc	1
	iadd
	putstatic	p38csx/count$  I
	ldc	"\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	"Solution#"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p38csx/count$  I
	invokestatic	CSXLib/printInt(I)V
	ldc	" is:"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	"\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	ldc	" "
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p38csx/a2$  I
	invokestatic	CSXLib/printInt(I)V
	ldc	" "
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p38csx/b2$  I
	invokestatic	CSXLib/printInt(I)V
	ldc	" "
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p38csx/c2$  I
	invokestatic	CSXLib/printInt(I)V
	ldc	" "
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p38csx/d2$  I
	invokestatic	CSXLib/printInt(I)V
	ldc	" "
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p38csx/e2$  I
	invokestatic	CSXLib/printInt(I)V
	ldc	" "
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p38csx/f2$  I
	invokestatic	CSXLib/printInt(I)V
	ldc	" "
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p38csx/g2$  I
	invokestatic	CSXLib/printInt(I)V
	ldc	" "
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	getstatic	p38csx/h2$  I
	invokestatic	CSXLib/printInt(I)V
	ldc	"\n"
	invokestatic	CSXLib/printString(Ljava/lang/String;)V
	goto	L115
L114:
L115:
	getstatic	p38csx/h2$  I
	ldc	1
	iadd
	putstatic	p38csx/h2$  I
	goto	L92
L93:
	goto	L116
L91:
L116:
	getstatic	p38csx/g2$  I
	ldc	1
	iadd
	putstatic	p38csx/g2$  I
	ldc	1
	putstatic	p38csx/h2$  I
	goto	L72
L73:
	goto	L117
L71:
L117:
	getstatic	p38csx/f2$  I
	ldc	1
	iadd
	putstatic	p38csx/f2$  I
	ldc	1
	putstatic	p38csx/g2$  I
	ldc	1
	putstatic	p38csx/h2$  I
	goto	L55
L56:
	goto	L118
L54:
L118:
	getstatic	p38csx/e2$  I
	ldc	1
	iadd
	putstatic	p38csx/e2$  I
	ldc	1
	putstatic	p38csx/f2$  I
	ldc	1
	putstatic	p38csx/g2$  I
	ldc	1
	putstatic	p38csx/h2$  I
	goto	L41
L42:
	goto	L119
L40:
L119:
	getstatic	p38csx/d2$  I
	ldc	1
	iadd
	putstatic	p38csx/d2$  I
	ldc	1
	putstatic	p38csx/e2$  I
	ldc	1
	putstatic	p38csx/f2$  I
	ldc	1
	putstatic	p38csx/g2$  I
	ldc	1
	putstatic	p38csx/h2$  I
	goto	L30
L31:
	goto	L120
L29:
L120:
	getstatic	p38csx/c2$  I
	ldc	1
	iadd
	putstatic	p38csx/c2$  I
	ldc	1
	putstatic	p38csx/d2$  I
	ldc	1
	putstatic	p38csx/e2$  I
	ldc	1
	putstatic	p38csx/f2$  I
	ldc	1
	putstatic	p38csx/g2$  I
	ldc	1
	putstatic	p38csx/h2$  I
	goto	L22
L23:
	goto	L121
L21:
L121:
	getstatic	p38csx/b2$  I
	ldc	1
	iadd
	putstatic	p38csx/b2$  I
	ldc	1
	putstatic	p38csx/c2$  I
	ldc	1
	putstatic	p38csx/d2$  I
	ldc	1
	putstatic	p38csx/e2$  I
	ldc	1
	putstatic	p38csx/f2$  I
	ldc	1
	putstatic	p38csx/g2$  I
	ldc	1
	putstatic	p38csx/h2$  I
	goto	L17
L18:
	getstatic	p38csx/a2$  I
	ldc	1
	iadd
	putstatic	p38csx/a2$  I
	ldc	1
	putstatic	p38csx/b2$  I
	ldc	1
	putstatic	p38csx/c2$  I
	ldc	1
	putstatic	p38csx/d2$  I
	ldc	1
	putstatic	p38csx/e2$  I
	ldc	1
	putstatic	p38csx/f2$  I
	ldc	1
	putstatic	p38csx/g2$  I
	ldc	1
	putstatic	p38csx/h2$  I
	goto	L13
L14:
	return
	.limit stack 25
	.limit locals	0
	.end method
