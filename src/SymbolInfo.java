import java.util.List;

/**************************************************
*  class used to hold information associated w/
*  Symbs (which are stored in SymbolTables)
*  Update to handle arrays and methods
*
****************************************************/

class SymbolInfo extends Symb {
 public ASTNode.Kinds kind; // Should always be Var in CSX-lite
 public ASTNode.Types type; // Should always be Integer or Boolean in CSX-lite
 public ArgListSet head;
 public int arraySize;
 public int varIndex;
 public String label;
 public ASTNode.AdrMode adr;
 public String topLabel;
 public String bottomLabel;
 public int numberOfLocals;
 public String methodReturnCode;

 public SymbolInfo(String id, ASTNode.Kinds k, ASTNode.Types t, int arraySize){    
	super(id);
	kind = k; type = t; this.arraySize = arraySize; adr = ASTNode.AdrMode.none;}
	
	public void insertArgsList(ArgListSet args) {
		if (head == null) {
			head = args;
		} else {
			args.next = head;
			head = args;
		}
	}
	
	public int overloadSize() {
		int size = 0;
		ArgListSet currentArgList = head;
		while (currentArgList != null) {
			size++;
			currentArgList = currentArgList.getNext();
		}
		return size;
	}
	
	public boolean argsExist(ArgListSet args) {
		ArgListSet currentArgList = head;
		while (currentArgList != null) {
			if (currentArgList.argsEqual(args)) {
				return true;
			}
			currentArgList = currentArgList.getNext();
		}
		
		return false;
	}
	
	public String argsMatchExactly(ArgListSet args) {
		boolean parm = false;
		String returnParm = "";
		int returnSize=0;
		ArgListSet currentArgList = head;
		while (currentArgList != null) {
			if (currentArgList.argsEqualExactly(args).contains("OK")) {
				return "OK";
			} else if (parm == true) {
				currentArgList = currentArgList.getNext();
				continue;
			} else if (currentArgList.argsEqualExactly(args).equals("SIZE")) {
				if (returnSize == 0) {
					returnSize = currentArgList.args.size();
				} else if (returnSize == 999) {
					continue;
				} else {
					returnSize = 999;
				}
			} else {
				parm = true;
				returnParm = currentArgList.argsEqualExactly(args);
			}
			currentArgList = currentArgList.getNext();
		}
		if (parm == true) {
			return returnParm;
		} else {
			return "" + "SIZE" + returnSize;
		}
	}
 
// public SymbolInfo(String id, int k, int t){
//	super(id);
//	kind = new Kinds(k); type = new Types(t);};
 public String toString(){
             return "("+name()+": kind=" + kind+ ", type="+  type+")";};
}



