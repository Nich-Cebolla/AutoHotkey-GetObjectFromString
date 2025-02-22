# GetObjectFromString
An AutoHotkey (AHK) function that converts a string object path to an object reference.

@@@Link@@@

## Parameters
- {String} Path - The object path string.

## Returns
- {Object} - The object reference.

## Examples
```ahk
  obj := {
      prop1: [1, 2, Map(
              'key1', 'value1',
              'key2', {prop2: 2, prop3: [3, 4]}
          )
      ]
  }
  Path := 'obj.prop1[3]["key2"].prop3'
  Obj := GetObjectFromString(Path)
  OutputDebug(Obj[2]) ; 4

  class Test {
      class NestedClass {
          InstanceProp {
              Get {
                  return ['Val1', { Prop: 'Hello, world!' }]
              }
          }
      }
  }
  Path := 'Test.NestedClass.Prototype.InstanceProp[2]'
  Obj := GetObjectFromString(Path)
  OutputDebug(Obj.Prop) ; Hello, world!
```

## Contents

### GetObjectFromString.ahk
Contains the code for the `GetObjectFromString` function.
