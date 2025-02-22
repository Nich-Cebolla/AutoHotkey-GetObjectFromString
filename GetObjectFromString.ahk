
/**
 * @description - Converts a string path to an object reference. The object at the input path must
 * exist in the current scope of the function call.
 * @param {String} Str - The object path.
 * @returns {Object} - The object reference.
 * @example
 *
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
 * @
 * This is compatible with class references.
 * @example
 *
    class Test {
        class NestedClass {
            InstanceProp {
                Get{
                    return ['Val1', { Prop: 'Hello, world!' }]
                }
            }
        }
    }
    Path := 'Test.NestedClass.Prototype.InstanceProp[2]'
    Obj := GetObjectFromString(Path)
    OutputDebug(Obj.Prop) ; Hello, world!
 *
 */
GetObjectFromString(Str) {
    static Pattern := '(?<=\.)[\w_\d]+(?COnProp)|\[\s*\K\d+(?COnIndex)|\[\s*(?<quote>[`'"])(?<key>.*?)(?<!``)(?:````)*\g{quote}(?COnKey)'
    RegExMatch(Str, '^[\w\d_]+', &InitialSegment)
    Pos := InitialSegment.Pos + InitialSegment.Len
    NewObj := %InitialSegment[0]%
    while RegExMatch(Str, Pattern, &Match, Pos)
        Pos := Match.Pos + Match.Len

    return NewObj

    OnProp(Match, *) {
        NewObj := NewObj.%Match[0]%
    }
    OnIndex(Match, *) {
        NewObj := NewObj[Number(Match[0])]
    }
    OnKey(Match, *) {
        NewObj := NewObj[Match['key']]
    }
}
