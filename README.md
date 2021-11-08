# Composable-Software-Tools
The following repository is a collection of command line tools that exploits semantics information. The repository is composed of:
 - *Filter*: command line utitlity to filter results from a table.
 - *JAVA2AST*: command line utility that given a Java program, generates a table containing the details of all the interesting ASTNodes in the Java Program.
 - *Replace*: command line utility to replace the filtered AST node from the input table with an instance of the desired new literal given as a flag.

---

## FILTER
Command line utitlity to filter results from a table. 


### Getting started
Clone the repository
```
git clone https://github.com/IdrissRio/Filter.git
```

Move into the repository folder

```
cd Filter
```

Run `./gradlew build`. This command will generate a jar file located in `app/filter.jar`.

### Example

Supposing that we get this table in std input:
```
+---------------------+------------+----------+--------------+------------+--------------+--------+----------+
|        NAME         | LINE_START | LINE_END | COLUMN_START | COLUMN_END |   REL_PATH   | VALUE  |   TYPE   |
+---------------------+------------+----------+--------------+------------+--------------+--------+----------+
|     MethodDecl      |     2      |    5     |      10      |     13     | Example.java |  bar   |   void   |
| VariableDeclarator  |     3      |    3     |      13      |     16     | Example.java |  BAR   |   int    |
|        Block        |     2      |    5     |      15      |     5      | Example.java |   -    |    -     |
|      ClassDecl      |     1      |    6     |      1       |     1      | Example.java |   -    | Example  |
| PrimitiveTypeAccess |     3      |    3     |      9       |     11     | Example.java |  int   |   int    |
| PrimitiveTypeAccess |     0      |    0     |      0       |     0      | Example.java |  void  |   void   |
|     VarDeclStmt     |     3      |    3     |      9       |     20     | Example.java |   -    |    -     |
|      Modifier       |     1      |    1     |      1       |     6      | Example.java | public | Modifier |
|   IntegerLiteral    |     3      |    3     |      19      |     19     | Example.java |   2    |   int    |
+---------------------+------------+----------+--------------+------------+--------------+--------+----------+
```

We will filter it with the following commands:
```java
java -jar filter.jar -filterby=type{int}
```
Producing the following result
```
+------------------------+--------------+------------+----------------+--------------+----------------+----------+------------+
|          NAME          |  LINE_START  |  LINE_END  |  COLUMN_START  |  COLUMN_END  |    REL_PATH    |  VALUE   |    TYPE    |
+------------------------+--------------+------------+----------------+--------------+----------------+----------+------------+
|   VariableDeclarator   |      3       |     3      |       13       |      16      |  Example.java  |   BAR    |    int     |
|   PrimitiveTypeAccess  |      3       |     3      |       9        |      11      |  Example.java  |   int    |    int     |
|     IntegerLiteral     |      3       |     3      |       19       |      19      |  Example.java  |    2     |    int     |
+------------------------+--------------+------------+----------------+--------------+----------------+----------+------------+
```

---

## JAVA2AST

Given a Java program, generates a table containing the details of all the interesting ASTNodes in the Java Program.


Java2AST is build as an extension of the ExtendJ Java Compiler. The properties are computed on demand using the Reference Attributed Grammar System JastAdd.
ExtendJ require a Java SDK >= 8.

### Installation
Clone the repository
```
git clone https://github.com/IdrissRio/JAVA2AST.git
```
then move into the `JAVA2AST` directory using the command:
```
cd JAVA2AST
```

Now, generate the jar file `java2ast.jar` by running:

```
./gradlew build
```

---

## Replace
Command line utility to replace the filtered AST node from the input table with an instance of the desired new literal given as a flag.

### Getting started
Clone the repository
```
git clone https://github.com/IdrissRio/Replace.git
```

Move into the repository folder

```
cd Replace
```

Run `./gradlew build`. This command will generate a jar file in `app/replace.jar`.

### Example

Let's suppose we have java source code:
```
public class Example{
    String bar(){
        int foo = 0; 
        return "Bar";
    }
}
```

We can replace the filter with the following command:
```java
java -jar replace.jar -replacewith=bar -fix
```

The output would be the source file with the replaced literal.

```
public class Example{
    String bar(){
        int bar = 0; 
        return "Bar";
    }
}
```

If you remove the parameter ```-fix``` from the command line then you get the output on the terminal. 

