# JVM

--------
Computer 
--------
- instruction set -> java bytecode
- manipulates memory at runtime


## Core responsibilities
 * Loading & interpreting bytecode
 * Security
 * Automatic memory management

recap
[ Hello.java ] -> compile -> [Hello.class] -> jvm(any platform)


## Specification & Implementation
 * Abract specification (api)
 * Concrete implementation
    - Oracles' HotSpot JVM
    - IBM's JVM
 * Runtime instance
    - jvm instance

## Performance
 * Bytecode interpretations is much faster
    - Java bytecode is compact, compiled, and optimized
 * Just-in-time (JIT) compilation



## Lifetime of a Type

 1. [Hello.class]
 2. JVM Load Class (called class Loading. performed by Class Loader component
 3. JVM Check if Well Formed: Verfication 
 4. Allocate Space for static variables: Preparation
 5. Load referenced classes: Resolution
 6. Initialize variables (

2=Loading
3,4,5=Linking
6=Initialization


### Class Loading
 * When jvm starts it gets allocated with memory from OS
 * jvm splits this memory into subareas

#### Loading Type
  
  class obj in heap? - Yes -> return Class obj
  - No -> .class found? - Yes -> create Class obj 
            - No -> Class Not Found Exception
            
 Class Loaders - Parent-Delegation
  1. Bootstrap Class Loader: $java_home$/jre/lib/rt.jar
  2. Extension Class Loader; $java_home$/jre/ext/*.jar
  3. Applicaiton Class Loader: classpath
  4. User-Defined Class Loader(s)

 First Time Loading of Class
  * new instance is created
  * Invoking static method
  * Accessing static field (exception: compile-time constants)
  * Subclass is loaded
  * Run from command line
  * Reflection

#### Class Object
 * JVM uses Class Object to create a new instance
 * ff can have Class Object
    - Class
    - Inteface
    - Primitives
    - void
    - Arrays
 * Contains meta-information
    - String getname();
    - Class getSuperClass();
    - boolean isInterface();
    - Class[] getInterfaces();
    - ClassLoader getClassLoader();
 
### Linking
 * Verification
 * examples:
     * final classes are not sub-classed
     * final methods are not overridden
     * No illegal method overloading
     * bytecode integrity:
         * jump instr. (if condition) does not send VM beyond end of method
 * Preparation: Storage allocaton of static fields, initializatio of default values
 * Resolution (optional): Resolves symbolic referencces & loads them:
     * Dynamic Linking approaches:
         * eager loading - after preparation
         * lazy loading - after initialization(on-demand)

## Reflection
 * Introspect known/uknown code
 * After runtime behavior due to introspection

### Reflection Use-Cases
 * Class browsers in IDE
 * Processing annotations, e.g., ORM frameworks, JUNIT
 * Dynamic proxies

### Accessing Class Object
 * objectRef.getClass()
 * Class.forName(String className)
 * Class literals
       Class.forName("java.lang.String"); 
       Class.forName("[D");
       Class.forName("[Ljava.lang.String");
       Class.forName("[[Ljava.lang.String");

### JVM User Space
 * Native Heap (JIT Code & Direct Buffer)
 * Method Area
 * Java Heap
 * JVM Stack
 * PC
 * Native method Stack

#### Method Area & Heap
 * Method Area: Classes:
     * Meta Info:
         * Names of type, superclass, super interfaces
         * Class/Interface
         * Type modifiers: abstract, final, public
     * Reference to Class object
     * Field Info
     * Runtime Constant Pool
     * Method Info
     * Method Table
 * Heap: Objects

#### Method Table



