# GetObjectFromString
An AutoHotkey (AHK) function that converts a string object path to an object reference.

## AutoHotkey Forum Link
https://www.autohotkey.com/boards/viewtopic.php?f=83&t=136004&p=598449#p598449

## Parameters
- {String} Path - The object path string.
- {Object} [InitialObj] - If set, the object path will be parsed as a property / item of this object.

## Returns
- {Object} - The object reference.

## Examples
```ahk
; Basic usage
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

; Usage with classes
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

; Usage with an input object
Obj := {
    Prop1: [1, 2, Map(
            'key1', 'value1',
            'key2', {prop2: 2, prop3: [3, 4]}
        )
    ]
}
Path := '[3]["key2"].prop3'
Arr := Obj.Prop1
InnerArr := GetObjectFromString(Path, Arr)
OutputDebug(InnerArr[2]) ; 4
```

## Contents

### GetObjectFromString.ahk
Contains the code for the `GetObjectFromString` function.

## Changelog
2025-02-23
- Added support for an initial object

2025-02-22
- Uploaded function
