//
//You may use this symbol table implementation or your own (from project 1)
//
import java.util.*;
import java.io.*;
class SymbolTable {
   class Scope {
      LinkedHashMap<String,Symb> currentScope;
      Scope next;
      Scope() {
         currentScope = new LinkedHashMap<String,Symb>();
         next = null;
      }
      Scope(Scope scopes) {
         currentScope = new LinkedHashMap<String,Symb>();
         next = scopes;
      }
   }

   private Scope top;

   SymbolTable() {top = new Scope();}

   public void openScope() {
      top = new Scope(top); }

   public void closeScope() throws EmptySTException {
      if (top == null)
         throw new EmptySTException();
      else top = top.next;
   }
   public String[] getTopScope(){
	   String[] symbols = new String[top.currentScope.size()];
	   Iterator<Map.Entry<String,Symb>> itr = top.currentScope.entrySet().iterator();
	   int i = 0;
	   while (itr.hasNext()) {
		 symbols[i] = itr.next().getKey();
		 i++;
	   }
	   return symbols;
   }
   public void insert(Symb s)
         throws DuplicateException, EmptySTException {
      String key = (s.name().toLowerCase());
      if (top == null) {
    	  throw new EmptySTException();
      }
      if (localLookup(key) != null)
         throw new DuplicateException();
      else top.currentScope.put(key,s);
   }

   public Symb localLookup(String s) {
      String key = s.toLowerCase();
      if (top == null)
         return null;
      Symb ans =top.currentScope.get(key);
      return ans;
   }

   public Symb globalLookup(String s) {
      String key = s.toLowerCase();
      Scope top = this.top;
      while (top != null) {
         Symb ans = top.currentScope.get(key);
         if (ans != null)
            return ans;
         else top = top.next;
      }
      return null;
   }

   public String toString() {
      String ans = "";
      Scope top = this.top;
      while (top != null) {
         ans = ans +  top.currentScope.toString()+"\n";
         top = top.next;
      }
      return ans;
   }
   

   void dump(PrintStream ps) {
     ps.print(toString());
   }
}
