class test49{	//should compile & run w/o error
   void test(int val, int expected,int ln){
   if (val != expected) 
   		print("Run-time error at line ",ln);
   }
   void test(char val, char expected,int ln){
   	 test((int) val, (int) expected,ln);}
   	 
   void test(bool val, bool expected,int ln){
   	 test((int) val, (int) expected,ln);}
   	 
   bool kaboom(){
   	print("Error in short-circuit evaluation of && or !!.\n");
   	return 0 == 1/0;
   }
  
  void main(){
    
    const T = true;
    const F =false;
    
    int i = 0;
    int j = 11111111B;
    print("Start test of binary operators.\n");
  
    test( !0 ,0-1,26);
    test(! 11111111B,11111111111111111111111100000000B,27);
    test((char) !'@','?',28);
    test(!true,false,29);
    test(!false,true,30);
    
    test(T&T,true,32);
    test(T&F,false,33);
    test(F&T,false,34);
    test(F&F,false,35);
    test(T|T,true,36);
    test(T|F,true,37);
    test(F|T,true,38);
    test(F|F,false,39);
    test(T&&T,true,40);
    test(T&&F,false,41);
    test(F&&T,false,42);
    test(F&&F,false,43);
    test(T||T,true,44);
    test(T||F,true,45);
    test(F||T,true,46);
    test(F||F,false,47);
    
    // Test short-circuit evaluation of && and ||
    // false && X should not evaluate X
    // true || Y should not evaluate Y
    // kaboom() in the following tests should not be evaluated
    
    test(F && kaboom(),false,54);
    test(T || kaboom(),true,55);
    
    
    
    print("Test of binary operators completed.\n");
  }
}
