import java.util.ArrayList;
import java.util.Arrays;

// The following methods type check  AST nodes used in CSX Lite
//  You will need to complete the methods after line 238 to type check the
//   rest of CSX
//  Note that the type checking done for CSX lite may need to be extended to
//   handle full CSX (for example binaryOpNode).

public class TypeChecking extends Visitor {

	// static int typeErrors = 0; // Total number of type errors found
	// public static SymbolTable st = new SymbolTable();
	int typeErrors; // Total number of type errors found
	SymbolTable st;
	SymbolTable lst;
	ArrayList<identNode> labels;
	static methodDeclNode currentMethod;
	static ArgListSet passedArgs;
	static int pass;
	static boolean readError;
	static boolean printError;
	static int labelCount = 0;

	TypeChecking() {
		typeErrors = 0;
		st = new SymbolTable();
		lst = new SymbolTable();
		labels = new ArrayList<identNode>();
		pass = 1;
	}

	boolean isTypeCorrect(csxLiteNode n) {
		this.visit(n);
		return (typeErrors == 0);
	}

	boolean isTypeCorrect(classNode n) {
		this.visit(n);
		return (typeErrors == 0);
	}

	static void assertCondition(boolean assertion) {
		if (!assertion)
			System.out.println("The initializer must be a scalar");
	}

	ASTNode.Types typeMustBe(ASTNode.Types testType, ASTNode.Types[] requiredTypes, String errorMsg) {
		boolean ok = true;
		if (testType != ASTNode.Types.Error) {
			ok = false;
			for (ASTNode.Types required : requiredTypes) {
				if (testType == required) {
					ok = true;
				}
			}
		}
		if (!ok) {
			System.out.println(errorMsg);
			typeErrors++;
			return ASTNode.Types.Error;
		}
		return ASTNode.Types.Unknown;
	}
	
	ASTNode.Types typesMustBeEqual(ASTNode.Types type1, ASTNode.Types type2, String errorMsg) {
		if ((type1 != ASTNode.Types.Error) && (type2 != ASTNode.Types.Error)) {
			if ((type1 != type2) && ((type1 != ASTNode.Types.Integer && type1 != ASTNode.Types.Character) ||
					(type2 != ASTNode.Types.Integer && type2 != ASTNode.Types.Character))) {
				System.out.println(errorMsg);
				typeErrors++;
				return ASTNode.Types.Error;
			}
		} else {
			return ASTNode.Types.Error;
		}
		return ASTNode.Types.Unknown;
	}


	String error(ASTNode n) {
		return "Error (line " + n.linenum + "): ";
	}

	static String opToString(int op) {
		switch (op) {
		case sym.PLUS:
			return (" + ");
		case sym.MINUS:
			return (" - ");
		case sym.EQ:
			return (" == ");
		case sym.NOTEQ:
			return (" != ");
		case sym.SLASH:
			return (" / ");
		case sym.TIMES:
			return (" * ");
		case sym.GT:
			return (" > ");
		case sym.LT:
			return (" < ");
		case sym.GEQ:
			return (" >= ");
		case sym.LEQ:
			return (" <= ");
		case sym.AND:
			return (" & ");
		case sym.CAND:
			return (" && ");
		case sym.OR:
			return (" | ");
		case sym.COR:
			return (" || ");
		case sym.NOT:
			return (" ! ");
		default:
			assertCondition(false);
			return "";
		}
	}

	// Extend this to handle all CSX binary operators
	static void printOp(int op) {
		switch (op) {
		case sym.PLUS:
			System.out.print(" + ");
			break;
		case sym.MINUS:
			System.out.print(" - ");
			break;
		case sym.EQ:
			System.out.print(" == ");
			break;
		case sym.NOTEQ:
			System.out.print(" != ");
			break;
		case sym.SLASH:
			System.out.print(" / ");
			break;
		case sym.TIMES:
			System.out.print(" * ");
			break;
		case sym.GT:
			System.out.print(" > ");
			break;
		case sym.LT:
			System.out.print(" < ");
			break;
		case sym.GEQ:
			System.out.print(" >= ");
			break;
		case sym.LEQ:
			System.out.print(" <= ");
			break;
		case sym.AND:
			System.out.print(" & ");
			break;
		case sym.CAND:
			System.out.print(" && ");
			break;
		case sym.OR:
			System.out.print(" | ");
			break;
		case sym.COR:
			System.out.print(" || ");
			break;
		case sym.NOT:
			System.out.print(" ! ");
			break;
		default:
			throw new Error();
		}
	}

	void visit(csxLiteNode n) {
		this.visit(n.progDecls);
		this.visit(n.progStmts);
	}

	void visit(fieldDeclsNode n) {
		this.visit(n.thisField);
		this.visit(n.moreFields);
	}

	void visit(nullFieldDeclsNode n) {
	}

	void visit(stmtsNode n) {
		// System.out.println ("In stmtsNode\n");
		printError = false;
		readError = false;
		this.visit(n.thisStmt);
		if (printError == true || readError == true) {
			typeErrors++;
		}
		this.visit(n.moreStmts);

	}

	void visit(nullStmtsNode n) {
	}

	// Extend varDeclNode's method to handle initialization
	void visit(varDeclNode n) {

		SymbolInfo id;
		// id = (SymbolInfo) st.localLookup(n.varName.idname);
		id = (SymbolInfo) st.localLookup(n.varName.idname);
		if (id != null) {
			System.out.println(error(n) + id.name() + " is already declared.");
			typeErrors++;
			n.varName.type = ASTNode.Types.Error;

		} else {
			if (!n.initValue.isNull()) {
				ASTNode.Types[] allowedTypes = { n.varType.type };
				exprNode initExpr = (exprNode) n.initValue;
				visit(initExpr);
				assertCondition(initExpr.kind == ASTNode.Kinds.Value || initExpr.kind == ASTNode.Kinds.Var
						|| initExpr.kind == ASTNode.Kinds.ScalarParm);
				typeMustBe(initExpr.type, allowedTypes, error(n) + "The initializer must be of type " + n.varType.type);
				
			}
			id = new SymbolInfo(n.varName.idname, ASTNode.Kinds.Var, n.varType.type, 0);
			n.varName.type = n.varType.type;
			n.varName.kind = ASTNode.Kinds.Var;
			try {
				st.insert(id);
			} catch (DuplicateException d) {
				/* can't happen */ } catch (EmptySTException e) {
				/* can't happen */ }
			n.varName.idinfo = id;
		}
	};

	void visit(nullTypeNode n) {
	}

	void visit(intTypeNode n) {
		// no type checking needed}
	}

	void visit(boolTypeNode n) {
		// no type checking needed}
	}

	void visit(identNode n) {
		SymbolInfo id;
		// id = (SymbolInfo) st.globalLookup(idname);
		id = (SymbolInfo) st.globalLookup(n.idname);
		if (id == null) {
			System.out.println(error(n) + n.idname + " is not declared.");
			typeErrors++;
			n.type = ASTNode.Types.Error;
		} else {
			n.type = id.type;
			n.kind = id.kind;
			n.idinfo = id; // Save ptr to correct symbol table entry
		}
	}

	// Extend nameNode's method to handle subscripts
	void visit(nameNode n) {
		this.visit(n.varName); // Subscripts not allowed in CSX Lite
		if (n.subscriptVal.isNull()) {
			n.type = n.varName.type;
			n.kind = n.varName.kind;
		} else {
			if (n.varName.kind != ASTNode.Kinds.Array && n.varName.kind != ASTNode.Kinds.ArrayParm) {
				System.out.println(error(n) + "Only arrays can be subscripted.");
				typeErrors++;
				n.type = ASTNode.Types.Error;
				return;
			}
			ASTNode.Types[] arithTypes = { ASTNode.Types.Integer, ASTNode.Types.Character };
			exprNode sub = (exprNode) n.subscriptVal;
			visit(sub);
			assertCondition(sub.kind == ASTNode.Kinds.Value || sub.kind == ASTNode.Kinds.Var
					|| sub.kind == ASTNode.Kinds.ScalarParm);
			n.type = typeMustBe(sub.type, arithTypes, error(n) + "Array subscripts must be integer or character expressions.");
			if (n.type != ASTNode.Types.Error) {
				n.type = n.varName.type;
				n.kind = ASTNode.Kinds.Var;
			}
		}

	}

	void visit(asgNode n) {
		this.visit(n.target);
		this.visit(n.source);
		if (n.source.type == ASTNode.Types.Error || n.target.type == ASTNode.Types.Error) {
			return;
		}
		if (n.target.kind != ASTNode.Kinds.Var && n.target.kind != ASTNode.Kinds.Array
				&& n.target.kind != ASTNode.Kinds.ScalarParm && n.target.kind != ASTNode.Kinds.ArrayParm) {
			System.out.println(error(n) + "Target of assignment can't be changed.");
			typeErrors++;
			return;
		}
		if (n.target.kind == ASTNode.Kinds.Var || n.target.kind == ASTNode.Kinds.ScalarParm) {
			if (n.source.kind != ASTNode.Kinds.Var && n.source.kind != ASTNode.Kinds.Value
					&& n.source.kind != ASTNode.Kinds.ScalarParm) {
				System.out.println(error(n) + "Right hand side of an assignment is not assignable to left hand side.");
				typeErrors++;
				return;
			}
			if (n.source.type != n.target.type) {
					System.out.println(error(n) + "Right hand side of an assignment is not assignable to left hand side.");
					typeErrors++;
			}
		} else if ((n.target.kind == ASTNode.Kinds.Array || n.target.kind == ASTNode.Kinds.ArrayParm) && (n.source.kind == ASTNode.Kinds.Array || n.source.kind == ASTNode.Kinds.ArrayParm)) {
			if (n.source.type != n.target.type) {
				System.out.println(error(n) + "Right hand side of an assignment is not assignable to left hand side.");
				typeErrors++;
				return;
			}
			if (n.source.kind == ASTNode.Kinds.ArrayParm) {
				return;
			}
			if (n.target.varName.idinfo.arraySize != ((nameNode) n.source).varName.idinfo.arraySize) {
				System.out.println(error(n) + "Source and target of the assignment must have the same length.");
				typeErrors++;
			}
		} else if (n.target.kind == ASTNode.Kinds.Array && n.target.type == ASTNode.Types.Character
				&& n.source.kind == ASTNode.Kinds.String) {
			strLitNode stringNode = (strLitNode)n.source;
			int stringLength = 0;
			int i = 1;
			while (i < stringNode.strval.length() - 1) {
				if (stringNode.strval.charAt(i) == '\\') {
					i += 2;
				} else {
					i++;
				}
				stringLength++;
			}
			if (n.target.varName.idinfo.arraySize != stringLength) {
				System.out.println(error(n) + "Source and target of the assignment must have the same length.");
				typeErrors++;
			}
		} else {
			System.out.println(error(n) + "Right hand side of an assignment is not assignable to left hand side.");
			typeErrors++;
		}

	}

	// Extend ifThenNode's method to handle else parts
	void visit(ifThenNode n) {
		this.visit(n.condition);
		ASTNode.Types[] types = { ASTNode.Types.Boolean };
		typeMustBe(n.condition.type, types, error(n) + "The control expression of an" + " if must be a bool.");

		this.visit(n.thenPart);
		this.visit(n.elsePart);
	}

	void visit(printNode n) {
		this.visit(n.outputValue);
		if (n.outputValue.kind == ASTNode.Kinds.Value || n.outputValue.kind == ASTNode.Kinds.Var || n.outputValue.kind == ASTNode.Kinds.ScalarParm) {
			if (n.outputValue.type != ASTNode.Types.Boolean && n.outputValue.type != ASTNode.Types.Integer && n.outputValue.type != ASTNode.Types.Character) {
				System.out.println(error(n) + "Only integers, booleans, strings, characters adn character arrays may be written.");
				printError = true;
			}
		} else if (n.outputValue.kind == ASTNode.Kinds.Array || n.outputValue.kind == ASTNode.Kinds.ArrayParm) {
			if (n.outputValue.type != ASTNode.Types.Character) {
				System.out.println(error(n) + "Only integers, booleans, strings, characters and character arrays may be written.");
				printError = true;
			}
		} else if (n.outputValue.kind != ASTNode.Kinds.String) {
			System.out.println(error(n) + "Only integers, booleans, strings, characters and character arrays may be written.");
			printError = true;
		}
		visit(n.morePrints);
	}

	void visit(blockNode n) {
		// open a new local scope for the block body
		st.openScope();
		this.visit(n.decls);
		this.visit(n.stmts);
		// close this block's local scope
		try {
			st.closeScope();
		} catch (EmptySTException e) {
			/* can't happen */ }
	}

	void visit(binaryOpNode n) {

		// Only four bin ops in CSX-lite
		assertCondition(n.operatorCode == sym.PLUS || n.operatorCode == sym.MINUS || n.operatorCode == sym.EQ
				|| n.operatorCode == sym.NOTEQ || n.operatorCode == sym.TIMES || n.operatorCode == sym.SLASH
				|| n.operatorCode == sym.CAND || n.operatorCode == sym.AND || n.operatorCode == sym.COR
				|| n.operatorCode == sym.OR || n.operatorCode == sym.GT || n.operatorCode == sym.LT
				|| n.operatorCode == sym.GEQ || n.operatorCode == sym.LEQ);
		this.visit(n.leftOperand);
		this.visit(n.rightOperand);
		ASTNode.Types lType;
		ASTNode.Types rType;
		if (n.leftOperand.kind != ASTNode.Kinds.Value && n.leftOperand.kind != ASTNode.Kinds.Var
				&& n.leftOperand.kind != ASTNode.Kinds.ScalarParm) {
			System.out.println(error(n) + "Left operand of" + opToString(n.operatorCode) + "must be scalar.");
			typeErrors++;
		}
		if (n.rightOperand.kind != ASTNode.Kinds.Value && n.rightOperand.kind != ASTNode.Kinds.ScalarParm
				&& n.rightOperand.kind != ASTNode.Kinds.Var) {
			System.out.println(error(n) + "Right operand of" + opToString(n.operatorCode) + "must be scalar");
			typeErrors++;
		}
		ASTNode.Types[] boolType = { ASTNode.Types.Boolean };
		ASTNode.Types[] arithTypes = { ASTNode.Types.Integer, ASTNode.Types.Character };
		if (n.operatorCode == sym.PLUS || n.operatorCode == sym.MINUS || n.operatorCode == sym.TIMES
				|| n.operatorCode == sym.SLASH) {
			n.type = ASTNode.Types.Integer;
			lType = typeMustBe(n.leftOperand.type, arithTypes,
					error(n) + "Left operand of" + opToString(n.operatorCode) + "must be arithmetic.");
			
			rType = typeMustBe(n.rightOperand.type, arithTypes,
					error(n) + "Right operand of" + opToString(n.operatorCode) + "must be arithmetic.");
			if (lType == ASTNode.Types.Error || rType == ASTNode.Types.Error) {
				n.type = ASTNode.Types.Error;
			}
		} else if (n.operatorCode == sym.CAND || n.operatorCode == sym.COR) {
			lType = typeMustBe(n.leftOperand.type, boolType,
					error(n) + "Left operand of" + opToString(n.operatorCode) + "must be a bool.");
			rType =typeMustBe(n.rightOperand.type, boolType,
					error(n) + "Right operand of" + opToString(n.operatorCode) + "must be a bool.");
			if (lType == ASTNode.Types.Error || rType == ASTNode.Types.Error) {
				n.type = ASTNode.Types.Error;
			}
		} else if (n.operatorCode == sym.AND || n.operatorCode == sym.OR) {
			String errorMsg = error(n) + "Operands of" + opToString(n.operatorCode)
					+ "must both be arithmetic or both must be boolean.";
			n.type = typesMustBeEqual(n.leftOperand.type, n.rightOperand.type, errorMsg);
			if (n.leftOperand.type == n.rightOperand.type && n.leftOperand.type != ASTNode.Types.Boolean && n.leftOperand.type != ASTNode.Types.Integer &&
					n.leftOperand.type != ASTNode.Types.Character) {
				System.out.println(error(n) + "Operands of" + opToString(n.operatorCode)
				+ "must both be arithmetic or both must be boolean.");
				typeErrors++;
				n.type = ASTNode.Types.Error;
			}
			if (n.leftOperand.type != ASTNode.Types.Boolean && n.type != ASTNode.Types.Error) {
				n.type = ASTNode.Types.Integer;
			} else {
				n.type = ASTNode.Types.Boolean;
			}
		} else {
			String errorMsg = error(n) + "Operands of" + opToString(n.operatorCode)
					+ "must both be arithmetic or both must be boolean.";
			n.type = typesMustBeEqual(n.leftOperand.type, n.rightOperand.type, errorMsg);
			if (n.leftOperand.type == n.rightOperand.type && n.leftOperand.type != ASTNode.Types.Boolean && n.leftOperand.type != ASTNode.Types.Integer &&
					n.leftOperand.type != ASTNode.Types.Character) {
				System.out.println(error(n) + "Operands of" + opToString(n.operatorCode)
				+ "must both be arithmetic or both must be boolean.");
				typeErrors++;
				n.type = ASTNode.Types.Error;
			}
			if (n.type != ASTNode.Types.Error) {
				n.type = ASTNode.Types.Boolean;
			}
		}
		n.kind = ASTNode.Kinds.Value;
	}

	void visit(intLitNode n) {
		// All intLits are automatically type-correct
	}

	// Extend these unparsing methods to correctly unparse CSX AST nodes

	void visit(classNode n) {
		visit(n.members);
		System.out.println("Error Count = " + typeErrors);
	}

	void visit(memberDeclsNode n) {
		SymbolInfo id;
		visit(n.fields);
		visit((methodDeclsNode) n.methods);
		id = (SymbolInfo)st.localLookup("main");
		if (id == null) {
			System.out.println(error(n) + "Main method never declared.");
			typeErrors++;
		}
		pass = 2;
		visit((methodDeclsNode) n.methods);
		
	}

	void visit(methodDeclsNode n) {
		visit(n.thisDecl);
		visit(n.moreDecls);
	}

	void visit(nullStmtNode n) {
	}

	void visit(nullReadNode n) {
	}

	void visit(nullPrintNode n) {
	}

	void visit(nullExprNode n) {
	}

	void visit(nullMethodDeclsNode n) {
	}

	void visit(methodDeclNode n) {
		SymbolInfo id;
		// id = (SymbolInfo) st.localLookup(n.varName.idname);
		if (pass == 1) {
			id = (SymbolInfo) st.localLookup(n.name.idname);
			if (id != null) {
				if ((id.kind != ASTNode.Kinds.Method) || (id.type != n.returnType.type)) {
					System.out.println(error(n) + id.name() + " is already declared.");
					typeErrors++;
					n.name.type = ASTNode.Types.Error;
					return;
				}
			} else {
				id = new SymbolInfo(n.name.idname, ASTNode.Kinds.Method, n.returnType.type, 0);
				try {
					st.insert(id);
				} catch (DuplicateException d) {
					/* can't happen */ } catch (EmptySTException e) {
					/* can't happen */ }
			}
			n.name.idinfo = id;
			n.name.type = n.returnType.type;
			n.name.kind = ASTNode.Kinds.Method;
			st.openScope();
			visit(n.args);
			String[] args = st.getTopScope();
			ArgListSet argList = new ArgListSet();
			String argString = "";
			if (args.length == 0) {
				argString += "NO ARGS";
				argList.addArgs(argString);
			} else {
				for (String arg : args) {
					argString = "";
					SymbolInfo argInfo = (SymbolInfo) st.localLookup(arg);
					if (argInfo.kind == ASTNode.Kinds.ScalarParm) {
						argString += "S";
					} else {
						argString += "A";
					}
					if (argInfo.type == ASTNode.Types.Boolean) {
						argString += "B";
					} else if (argInfo.type == ASTNode.Types.Integer) {
						argString += "I";
					} else {
						argString += "C";
					}
					argList.addArgs(argString);
				}
			}
			if (id.argsExist(argList)) {
				System.out.println(error(n) + id.name() + " is already declared with given arguments.");
				typeErrors++;
				n.name.type = ASTNode.Types.Error;
			} else {
				id.insertArgsList(argList);
			}
			try {
				st.closeScope();
			} catch (EmptySTException e) {
				// Shouldn't happen
			}
		} else if (pass == 2) {
			currentMethod = n;
			st.openScope();
			visit(n.args);
			visit(n.decls);
			visit(n.stmts);
			try {
				st.closeScope();
			} catch (EmptySTException e) {
				// Shouldn't happen
			}
		}

	}

	void visit(incrementNode n) {
		boolean errorThrown = false;
		visit(n.target);
		ASTNode.Types[] types = { ASTNode.Types.Integer, ASTNode.Types.Character };
		typeMustBe(n.target.type, types, error(n) + "Operand of ++ must be arithmetic.");
		if (n.target.kind != ASTNode.Kinds.Var && n.target.kind != ASTNode.Kinds.Value && n.target.kind != ASTNode.Kinds.ScalarParm) {
			System.out.println(error(n) + "Operand of ++ must be scalar.");
			if(n.target.type == ASTNode.Types.Character || n.target.type != ASTNode.Types.Integer) {
				typeErrors++;
				errorThrown = true;
			}
		}
		if (n.target.type != ASTNode.Types.Integer && n.target.type != ASTNode.Types.Character) {
			errorThrown = true;
		}
		if (n.target.kind != ASTNode.Kinds.Var && n.target.kind != ASTNode.Kinds.ScalarParm && n.target.kind != ASTNode.Kinds.Array 
				&& n.target.kind != ASTNode.Kinds.ArrayParm) {
			System.out.println(error(n) + "Target of ++ can't be changed.");
			if (!errorThrown) {
				typeErrors++;
			}
		}
	}

	void visit(decrementNode n) {
		boolean errorThrown = false;
		visit(n.target);
		ASTNode.Types[] types = { ASTNode.Types.Integer, ASTNode.Types.Character };
		typeMustBe(n.target.type, types, error(n) + "Operand of -- must be arithmetic.");
		if (n.target.kind != ASTNode.Kinds.Var && n.target.kind != ASTNode.Kinds.Value && n.target.kind != ASTNode.Kinds.ScalarParm) {
			System.out.println(error(n) + "Operand of -- must be scalar.");
			if(n.target.type == ASTNode.Types.Character || n.target.type != ASTNode.Types.Integer) {
				typeErrors++;
				errorThrown = true;
			}
		}
		if (n.target.type != ASTNode.Types.Integer && n.target.type != ASTNode.Types.Character) {
			errorThrown = true;
		}
		if (n.target.kind != ASTNode.Kinds.Var && n.target.kind != ASTNode.Kinds.ScalarParm && n.target.kind != ASTNode.Kinds.Array 
				&& n.target.kind != ASTNode.Kinds.ArrayParm) {
			System.out.println(error(n) + "Target of -- can't be changed.");
			if (!errorThrown) {
				typeErrors++;
			}
		}
	}

	void visit(argDeclsNode n) {
		visit(n.thisDecl);
		visit(n.moreDecls);
	}

	void visit(nullArgDeclsNode n) {
	}

	void visit(valArgDeclNode n) {
		SymbolInfo id;
		// id = (SymbolInfo) st.localLookup(n.varName.idname);
		id = (SymbolInfo) st.localLookup(n.argName.idname);
		if (n.argName.type == ASTNode.Types.Error) {
			n.argName.kind = ASTNode.Kinds.ScalarParm;
			return;
		}
		if (id != null) {
			System.out.println(error(n) + id.name() + " is already declared.");
			typeErrors++;
			n.argName.type = ASTNode.Types.Error;

		} else {
			id = new SymbolInfo(n.argName.idname, ASTNode.Kinds.ScalarParm, n.argType.type, 0);
			n.argName.type = n.argType.type;
			n.argName.kind = ASTNode.Kinds.ScalarParm;
			try {
				st.insert(id);
			} catch (DuplicateException d) {
				/* can't happen */ } catch (EmptySTException e) {
				/* can't happen */ }
			n.argName.idinfo = id;
		}
	}

	void visit(arrayArgDeclNode n) {
		SymbolInfo id;
		// id = (SymbolInfo) st.localLookup(n.varName.idname);
		id = (SymbolInfo) st.localLookup(n.argName.idname);
		if (n.argName.type == ASTNode.Types.Error) {
			return;
		}
		if (id != null) {
			System.out.println(error(n) + id.name() + " is already declared.");
			typeErrors++;
			n.argName.type = ASTNode.Types.Error;

		} else {
			id = new SymbolInfo(n.argName.idname, ASTNode.Kinds.ArrayParm, n.elementType.type, 0);
			n.argName.type = n.elementType.type;
			n.argName.kind = ASTNode.Kinds.ArrayParm;
			try {
				st.insert(id);
			} catch (DuplicateException d) {
				/* can't happen */ } catch (EmptySTException e) {
				/* can't happen */ }
			n.argName.idinfo = id;
		}
	}

	void visit(constDeclNode n) {
		SymbolInfo id;
		// id = (SymbolInfo) st.localLookup(n.varName.idname);
		id = (SymbolInfo) st.localLookup(n.constName.idname);
		if (id != null) {
			System.out.println(error(n) + id.name() + " is already declared.");
			typeErrors++;
			n.constName.type = ASTNode.Types.Error;

		} else {
			visit(n.constValue);
			if (n.constValue.kind != ASTNode.Kinds.Value && n.constValue.kind != ASTNode.Kinds.Var
					&& n.constValue.kind != ASTNode.Kinds.ScalarParm) {
				System.out.println(error(n) + " Type could not be determined");
				typeErrors++;
				n.constName.type = ASTNode.Types.Error;
				return;
			}
			id = new SymbolInfo(n.constName.idname, ASTNode.Kinds.Value, n.constValue.type, 0);
			n.constName.type = n.constValue.type;
			n.constName.kind = ASTNode.Kinds.Value;
			try {
				st.insert(id);
			} catch (DuplicateException d) {
				/* can't happen */ } catch (EmptySTException e) {
				/* can't happen */ }
			n.constName.idinfo = id;
		}

	}

	void visit(arrayDeclNode n) {
		SymbolInfo id;
		// id = (SymbolInfo) st.localLookup(n.varName.idname);
		id = (SymbolInfo) st.localLookup(n.arrayName.idname);
		if (id != null) {
			System.out.println(error(n) + id.name() + " is already declared.");
			typeErrors++;
			n.arrayName.type = ASTNode.Types.Error;

		} else if (n.arraySize.intValue <= 0) {
			System.out.println(error(n) + n.arrayName.idname + " must have more than 0 elements.");
			typeErrors++;
			n.arrayName.type = ASTNode.Types.Error;
		} else {
			id = new SymbolInfo(n.arrayName.idname, ASTNode.Kinds.Array, n.elementType.type, n.arraySize.intValue);
			n.arrayName.type = n.elementType.type;
			n.arrayName.kind = ASTNode.Kinds.Array;

			try {
				st.insert(id);
			} catch (DuplicateException d) {
				/* can't happen */ } catch (EmptySTException e) {
				/* can't happen */ }
			n.arrayName.idinfo = id;
		}
	}

	void visit(charTypeNode n) {
		//no type checking needed
	}

	void visit(voidTypeNode n) {
		// no type checking needed
	}

	void visit(whileNode n) {
		ASTNode.Types[] boolTypes = { ASTNode.Types.Boolean };
		visit(n.condition);
		typeMustBe(n.condition.type, boolTypes, error(n) + "Condition of while statement must be boolean.");
		if (n.condition.kind != ASTNode.Kinds.Value && n.condition.kind != ASTNode.Kinds.Var
				&& n.condition.kind != ASTNode.Kinds.ScalarParm) {
			System.out.println(error(n) + "Illegal condition for while statement.");
			typeErrors++;
			n.condition.type = ASTNode.Types.Error;
		}
		if (n.label.isNull()) {
			visit(n.loopBody);
			return;
		}
		identNode label = (identNode) n.label;
		lst.openScope();
		SymbolInfo id = new SymbolInfo(label.idname, ASTNode.Kinds.VisibleLabel, ASTNode.Types.Unknown, 0);
		label.idinfo = id;
		label.type = ASTNode.Types.Unknown;
		label.kind = ASTNode.Kinds.VisibleLabel;
		try {
			lst.insert(id);
		} catch (DuplicateException d) {
			/* can't happen */ } catch (EmptySTException e) {
			/* can't happen */ }
		labels.add(label);
		visit(n.loopBody);
		label.kind = ASTNode.Kinds.HiddenLabel;
		labels.remove(label);
		try {
			lst.closeScope();
		} catch (EmptySTException e) {
			/* can't happen */ }
	}

	void visit(breakNode n) {
		SymbolInfo id = (SymbolInfo)lst.globalLookup(n.label.idname);
		/*for (identNode label : labels) {
			if (n.label.idname.equals(label.idname) && label.kind == ASTNode.Kinds.VisibleLabel) {
				return;
			}
		}*/
		if(id == null || id.kind != ASTNode.Kinds.VisibleLabel) {
			System.out.println(error(n) + n.label.idname + " doesn't label an enclosing while loop.");
			typeErrors++;
			n.label.type = ASTNode.Types.Error;
		}
		n.label.idinfo = id;
	}

	void visit(continueNode n) {
		SymbolInfo id = (SymbolInfo)lst.globalLookup(n.label.idname);
		/*for (identNode label : labels) {
			if (n.label.idname.equals(label.idname) && label.kind == ASTNode.Kinds.VisibleLabel) {
				return;
			}
		}*/
		if(id == null || id.kind != ASTNode.Kinds.VisibleLabel) {
			System.out.println(error(n) + n.label.idname + " doesn't label an enclosing while loop.");
			typeErrors++;
			n.label.type = ASTNode.Types.Error;
		}
		n.label.idinfo = id;
	}

	void visit(callNode n) {
		SymbolInfo id;
		// id = (SymbolInfo) st.globalLookup(idname);
		id = (SymbolInfo) st.globalLookup(n.methodName.idname);
		if (id == null) {
			System.out.println(error(n) + n.methodName.idname + " is not declared.");
			typeErrors++;
			n.methodName.type = ASTNode.Types.Error;
		} else {
			if (id.kind != ASTNode.Kinds.Method) {
				System.out.println(error(n) + n.methodName.idname + " isn't a method.");
				typeErrors++;
				return;
			}
			if (id.type != ASTNode.Types.Void) {
				System.out.println(error(n) + n.methodName.idname + " is called as a procedure and must therefore return void.");
				typeErrors++;
				return;
			}
			n.methodName.type = ASTNode.Types.Void;
			n.methodName.kind = ASTNode.Kinds.Method;
			passedArgs = new ArgListSet(passedArgs);
			visit(n.args);
			if (passedArgs.args.size() == 0) {
				passedArgs.addArgs("NO ARGS");
			}
			if (id.argsMatchExactly(passedArgs).contains("OK")) {
				n.methodName.idinfo = id;
				passedArgs.popArgListSet();
				return;
			} else if (id.argsMatchExactly(passedArgs).contains("SIZE")) {
				String[] sizeAry = id.argsMatchExactly(passedArgs).split("SIZE");
				if (Integer.parseInt(sizeAry[1]) == 999) {
					System.out.println(error(n) + "None of the " + id.overloadSize() + " definitions of method " + n.methodName.idname + " match the parameters in this call.");
					typeErrors++;
					n.methodName.type = ASTNode.Types.Error;
					return;
				}
				System.out.println(error(n) + n.methodName.idname + " requires " + sizeAry[1] + " parameters.");
				typeErrors++;
				n.methodName.type = ASTNode.Types.Error;
			} else {
				System.out.println("here");
				String [] parameterAry = id.argsMatchExactly(passedArgs).split(",");
				for (String parameter : parameterAry) {
					System.out.println(error(n) + "In the call to " + n.methodName.idname + ", parameter "
						+ parameter + " has incorrect type.");
					typeErrors++;
				}
				n.methodName.type = ASTNode.Types.Error;
			}
		}
	}

	void visit(readNode n) {
		visit(n.targetVar);
		if (n.targetVar.kind != ASTNode.Kinds.Var && n.targetVar.kind != ASTNode.Kinds.ScalarParm) {
			System.out.println(error(n) + n.targetVar.varName.idname + " may not be assigned to.");
			readError = true;
		}
		if (n.targetVar.type != ASTNode.Types.Integer && n.targetVar.type != ASTNode.Types.Character) {
			System.out.println(error(n) + "Only integers and characters may be read.");
			readError = true;
		}
		visit(n.moreReads);
	}

	void visit(returnNode n) {
		if (n.returnVal.isNull()) {
			if (currentMethod.returnType.type != ASTNode.Types.Void) {
				System.out.println(error(n) + "Return type of " + currentMethod.name.idname + " is not void.");
				typeErrors++;
			}
		} else {
			exprNode returnVal = (exprNode)n.returnVal;
			visit(returnVal);
			if (returnVal.type != currentMethod.returnType.type) {
				System.out.println(error(n) + "Return type of "
					+ currentMethod.name.idname + " is " + currentMethod.returnType.type);
				typeErrors++;
				returnVal.type = ASTNode.Types.Error;
			}
			if (returnVal.kind != ASTNode.Kinds.Value && returnVal.kind != ASTNode.Kinds.Var && returnVal.kind != ASTNode.Kinds.ScalarParm) {
				System.out.println(error(n) + "Illegal return value");
				if (returnVal.type != ASTNode.Types.Error) {
				typeErrors++;
				}
				returnVal.type = ASTNode.Types.Error;
			}
		}
	}

	void visit(argsNode n) {
		visit (n.argVal);
		if(!n.argVal.isNull()) {
			if (n.argVal.kind != ASTNode.Kinds.ScalarParm && n.argVal.kind != ASTNode.Kinds.Value
					&& n.argVal.kind != ASTNode.Kinds.Var && n.argVal.kind != ASTNode.Kinds.Array
					&& n.argVal.kind != ASTNode.Kinds.ArrayParm) {
				System.out.println(error(n) + "Illegal argument.");
				typeErrors++;
				n.argVal.type = ASTNode.Types.Error;
			}
			String argString = "";
			if (n.argVal.kind == ASTNode.Kinds.ScalarParm || n.argVal.kind == ASTNode.Kinds.Value
					|| n.argVal.kind == ASTNode.Kinds.Var) {
				argString += "S";
			} else if (n.argVal.kind == ASTNode.Kinds.Array || n.argVal.kind == ASTNode.Kinds.ArrayParm) {
				argString += "A";
			}
			if (n.argVal.type == ASTNode.Types.Boolean) {
				argString += "B";
			} else if (n.argVal.type == ASTNode.Types.Integer) {
				argString += "I";
			} else {
				argString += "C";
			}
			if (argString.isEmpty()){
				argString = "ERROR";
			}
			passedArgs.addArgs(argString);
		}
		visit (n.moreArgs);
	}

	void visit(nullArgsNode n) {
	}

	void visit(castNode n) {
		boolean errorsExist = false;
		visit(n.operand);
		ASTNode.Types[] allTypes = {ASTNode.Types.Boolean, ASTNode.Types.Integer, ASTNode.Types.Character};
		typeMustBe(n.operand.type, allTypes, error(n) + "Operand of cast must be an integer, character or boolean.");
		if (n.operand.type != ASTNode.Types.Boolean && n.operand.type != ASTNode.Types.Character && n.operand.type != ASTNode.Types.Integer) {
			errorsExist = true;
		}
		if (n.operand.kind != ASTNode.Kinds.Value && n.operand.kind != ASTNode.Kinds.Var && n.operand.kind != ASTNode.Kinds.ScalarParm) {
			System.out.println(error(n) + "Operand of cast must be an integer, character or boolean.");
			if (!errorsExist) {typeErrors++;}
		}
		n.kind = ASTNode.Kinds.Value;
		n.type = n.resultType.type;
	}

	void visit(fctCallNode n) {
		SymbolInfo id;
		// id = (SymbolInfo) st.globalLookup(idname);
		id = (SymbolInfo) st.globalLookup(n.methodName.idname);
		if (id == null) {
			System.out.println(error(n) + n.methodName.idname + " is not declared.");
			typeErrors++;
			n.type = ASTNode.Types.Error;
		} else {
			if (id.kind != ASTNode.Kinds.Method) {
				System.out.println(error(n) + n.methodName.idname + " isn't a method.");
				typeErrors++;
				n.type = ASTNode.Types.Error;
				return;
			}
			if (id.type != ASTNode.Types.Integer && id.type != ASTNode.Types.Character && id.type != ASTNode.Types.Boolean) {
				System.out.println(error(n) + n.methodName.idname + " is called as a function and must therefore return integer, boolean or character.");
				typeErrors++;
				n.type = ASTNode.Types.Error;
				return;
			}
			n.type = id.type;
			n.kind = ASTNode.Kinds.Value;
			passedArgs = new ArgListSet(passedArgs);
			visit(n.methodArgs);
			if (passedArgs.args.size() == 0) {
				passedArgs.addArgs("NO ARGS");
			}
			if (id.argsMatchExactly(passedArgs).contains("OK")) {
				n.methodName.idinfo = id;
				passedArgs.popArgListSet();
				return;
			} else if (id.argsMatchExactly(passedArgs).contains("SIZE")) {
				String[] sizeAry = id.argsMatchExactly(passedArgs).split("SIZE");
				if (Integer.parseInt(sizeAry[1]) == 999) {
					System.out.println(error(n) + "None of the " + id.overloadSize() + " definitions of method " + n.methodName.idname + " match the parameters in this call.");
					typeErrors++;
					n.methodName.type = ASTNode.Types.Error;
					return;
				}
				System.out.println(error(n) + n.methodName.idname + " requires " + sizeAry[1] + " parameters.");
				typeErrors++;
				n.methodName.type = ASTNode.Types.Error;
			} else {
				String [] parameterAry = id.argsMatchExactly(passedArgs).split(",");
				for (String parameter : parameterAry) {
					System.out.println(error(n) + "In the call to " + n.methodName.idname + ", parameter "
						+ parameter + " has incorrect type.");
					typeErrors++;
				}
				n.methodName.type = ASTNode.Types.Error;
			}
		}
	}

	void visit(unaryOpNode n) {
		assertCondition(n.operatorCode == sym.NOT);
		visit(n.operand);
		if (n.operand.kind != ASTNode.Kinds.Value && n.operand.kind != ASTNode.Kinds.Var
				&& n.operand.kind != ASTNode.Kinds.ScalarParm) {
			System.out.println(error(n) + "Operand of ! must be a scalar");
			typeErrors++;
			n.type = ASTNode.Types.Error;
		}
		n.kind = ASTNode.Kinds.Value;
		ASTNode.Types[] allTypes = {ASTNode.Types.Integer, ASTNode.Types.Character, ASTNode.Types.Boolean };
		typeMustBe(n.operand.type, allTypes, error(n) + "Operand of ! must be boolean.");
		if (n.operand.type != ASTNode.Types.Boolean && n.operand.type != ASTNode.Types.Integer && n.operand.type != ASTNode.Types.Character) {
			n.type = ASTNode.Types.Error;
			return;
		}
		if (n.operand.type == ASTNode.Types.Boolean) {
		n.type = ASTNode.Types.Boolean;
		} else {
			n.type = ASTNode.Types.Integer;
		}
	}

	void visit(charLitNode n) {
		assertCondition(n.type == ASTNode.Types.Character && n.kind == ASTNode.Kinds.Value);
	}

	void visit(strLitNode n) {
		assertCondition(n.type == ASTNode.Types.Character && n.kind == ASTNode.Kinds.String);
	}

	void visit(trueNode n) {
		assertCondition(n.type == ASTNode.Types.Boolean && n.kind == ASTNode.Kinds.Value && n.intValue == 1);
	}

	void visit(falseNode n) {
		assertCondition(n.type == ASTNode.Types.Boolean && n.kind == ASTNode.Kinds.Value && n.intValue == 0);
	}

	void visit(bitStringNode n) {
		assertCondition(n.type == ASTNode.Types.Integer && n.kind == ASTNode.Kinds.Value);
	}


}
