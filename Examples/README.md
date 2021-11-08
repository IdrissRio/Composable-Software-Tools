# Examples
In this `README.md` we will present some example of how to use some of the tools inclueded in this repository.

The running example is the following one:
```java
public class Example {
  static int baz;
  int FOO = 0;
  int test() {
    int z = Example.baz;
    int BAR = 2 + FOO;
    return BAR;
  }
}

```

Let us move into the directory `JAVA2AST`
```
cd JAVA2AST
```

Let us get all the interesting information in the file `Example.java`.

`java -jar 