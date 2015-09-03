Mockito
=======

refer: http://site.mockito.org/mockito/docs/current/org/mockito/Mockito.html


What can not be mocked by Mockito?
-----------------------------
- final attribute.
- private/static methods



Set up
------

In your module gradle file:
```
repositories { jcenter() }
dependencies { testCompile "org.mockito:mockito-core:1.+" }
```

mock(): create mock
-------------------

### when( ~~~ ).then( ~~~ )
- when(): to specify how a mock should behave
- verify(): Verifies certain behavior happened once.

```
 //Let's import Mockito statically so that the code looks clearer
 import static org.mockito.Mockito.*;

 //mock creation
 List mockedList = mock(List.class);

 //stubbing
 when(mockedList.get(0)).thenReturn("first");
 when(mockedList.get(1)).thenThrow(new RuntimeException());

 //using mock object
 mockedList.add("one");
 mockedList.clear();

 //verification
 verify(mockedList).add("one");
 verify(mockedList).clear();
 verify(mockedList).get(0);
```

### doReturn()|doThrow()| doAnswer()|doNothing()|doCallRealMethod() family of methods

Stubbing void methods

```
 doThrow(new RuntimeException()).when(mockedList).clear();

 //following throws RuntimeException:
 mockedList.clear();
```

### [Argument matchers](http://site.mockito.org/mockito/docs/current/org/mockito/Matchers.html)

```
//stubbing using built-in anyInt() argument matcher
 when(mockedList.get(anyInt())).thenReturn("element");

 //stubbing using custom matcher (let's say isValid() returns your own matcher implementation):
 when(mockedList.contains(argThat(isValid()))).thenReturn("element");

 //following prints "element"
 System.out.println(mockedList.get(999));

 //you can also verify using an argument matcher
 verify(mockedList).get(anyInt());
 ```


### Stubbing consecutive calls

```
 when(mock.someMethod("some arg"))
   .thenThrow(new RuntimeException())
   .thenReturn("foo");

 //First call: throws runtime exception:
 mock.someMethod("some arg");

 //Second call: prints "foo"
 System.out.println(mock.someMethod("some arg"));

 //Any consecutive call: prints "foo" as well (last stubbing wins).
 System.out.println(mock.someMethod("some arg"));


 //Alternative, shorter version of consecutive stubbing
 when(mock.someMethod("some arg"))
   .thenReturn("one", "two", "three");

 ```


### Optional Answer for unstubbed methods

[Optional Answer](http://mockito.github.io/mockito/docs/current/org/mockito/Mockito.html#field_summary) to be used with `mock(Class, Answer)`

|         Field       | Description |
| ------------------- | ----------- |
| CALLS_REAL_METHODS  | delegate to the real implementation. |
| RETURNS_DEEP_STUBS  | Mocking a mock to return a mock, ..., and finally return something meaningful hints<br> ex: when(mock.getBar().getName()).thenReturn("deep"); |
| RETURNS_DEFAULTS    | return [EmptyValues](http://site.mockito.org/mockito/docs/current/org/mockito/internal/stubbing/defaultanswers/ReturnsEmptyValues.html).  |
| RETURNS_MOCKS       | return  ['improved' EmptyValues](http://docs.mockito.googlecode.com/hg/latest/org/mockito/internal/stubbing/defaultanswers/ReturnsMoreEmptyValues.html) |
| RETURNS_SMART_NULLS | returns SmartNull instead of null.<br> SmartNull gives nicer exception message than points out the line where unstubbed method was called. |

Example:

```
 Foo mock = mock(Foo.class, CALLS_REAL_METHODS);

 // this calls the real implementation of Foo.getSomething()
 value = mock.getSomething();

 when(mock.getSomething()).thenReturn(fakeValue);

 // now fakeValue is returned
 value = mock.getSomething();

```

### Custom Answer with callbacks

example of stubbing with callbacks
```
when(mock.someMethod(anyString())).thenAnswer(new Answer() {
     Object answer(InvocationOnMock invocation) {
         Object[] args = invocation.getArguments();
         Object mock = invocation.getMock();
         return "called with arguments: " + args;
     }
 });

 //Following prints "called with arguments: foo"
 System.out.println(mock.someMethod("foo"));
```



spy(): partial mocking,
------------------------

real methods are invoked but still can be verified and stubbed

>> What's the different with mock(Class, CALLS_REAL_METHODS)?

Mockito *does not* delegate calls to the passed real instance, instead it actually creates a copy of it.

Two usage:

First: spy real object

```java
List list = new LinkedList();
List spy = spy(list);

//optionally, you can stub out some methods:
when(spy.size()).thenReturn(100);

```


Second: spy Class, then create mock object
This is particularly useful for spying on abstract classes because they cannot be instantiated

```java
SomeAbstract spy = spy(SomeAbstract.class);

//Robust API, via settings builder:
OtherAbstract spy = mock(OtherAbstract.class, withSettings()
    .useConstructor().defaultAnswer(CALLS_REAL_METHODS));


```
