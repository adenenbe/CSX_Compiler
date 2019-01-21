##README Aron Denenberg CS 536 Project 5 Code Generator

This section of the compiler was completed exclusively in a the CodeGenerating.jav class. The entirety of the compiler is controlled
thought the CSX.java class, however, minimal changes were made to that class for this project (just converting it to initiate code generation
for CSX rather than CSX Lite. All supporting compiler pieces necessary before code generation were from the previous projects in this
class (scanner, parser, and type checker). Additionally CSXLib.java was used to support basic function calls necessary for the machine,
however, this file was already provided and not altered during the project.

CodeGenerating.java is dependent on the scanner and parser (csx.jlex and csx.cup). Their utility is in ensuring that the program to
be run is a syntactically valid program as per the CSX grammar. Once verified they created a AST which was used by the CodeGenerator to logically
go through the high level code and create corresponding machine code. The Typecheckers utility was mainly in ensuring that the semantics of the language
were correct, and therefore weren't goin to cause the machine code to crash. However, the type checker also served an important purpose of guiding
the code generator in portions of the code where context mattered. This was done by giving the codegenerator access to symbol table entries that stored
context specific information for certain entities encountered during code generation. For example, in certain situations the code generator needed to know
the kind of a name node (scalar or array, parameter or local variable), method call, and label (ie. what label should a break node correspond with. 
This is all information that was checked and stored in the symbol table during type checking, so this was easily transferred over to the code generator
by storing a reference from each entity to their symbol table information.

With all this necessary information the symbol table was able to run thought the AST and transform each construct from CSX into a corresponding JVM instruction. 
This was written to a .j file and interpreted by jasmin to create a .class file that can run on any machine running java. Thus, the final step is completed
in compiling a CSX program, actually executing the instructions and giving the users what they want!