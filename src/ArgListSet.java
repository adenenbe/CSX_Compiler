import java.util.ArrayList;


public class ArgListSet {
	ArrayList<String> args;
	ArgListSet next;

	
	public ArgListSet() {
		args = new ArrayList<String>();
		next = null;
	}
	
	public ArgListSet(ArgListSet sets) {
		args = new ArrayList<String>();
		next = sets;
	}
	
	void popArgListSet(){
		if (next == null) {
			args = null;
			return;
		}
		args = next.args;
		next = next.next;
	}
	
	public void addArgs(String args) {
		this.args.add(args);
	}
	
	public ArgListSet getNext() {
		return next;
	}
	
	public int size() {
		return args.size();
	}
	
	public boolean argsEqual(ArgListSet compareSet) {
		if (this.args.size() != compareSet.args.size()) {
			return false;
		}
		for (String arg : args) {
			if (!compareSet.args.contains(arg)) {
				return false;
			}
		}
		for (String arg : compareSet.args) {
			if(!args.contains(arg)) {
				return false;
			}
		}
			
		return true;
	}
	
	public String argsEqualExactly(ArgListSet compareSet) {
		String returnVal = "";
		if (this.args.size() != compareSet.args.size()) {
			return "SIZE";
		}
		for (int i = 0; i < args.size(); i++) {
			if (!args.get(i).equals(compareSet.args.get(i))) {
				int returnNum = i + 1;
				if (!returnVal.equals("")){
					returnVal += "," + returnNum;
				} else {
					returnVal += returnNum;
				}
			}
		}
		if (!returnVal.equals("")) {
			return returnVal;
		}
		return "OK";
	}
}

