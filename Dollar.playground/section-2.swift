func frequencies <T, U, E:Hashable>(dict:[T:U], function: (T, U) -> E) -> [E:Int]
{
    var result = [E:Int]();
    for(key, value) in dict{
        let resultKey = function(key, value);
        if var freq = result[resultKey]{
            result[resultKey] = freq + 1;
        } else {
            result[resultKey] = 1;
        }
    }
    return result;
}


let result = $.frequencies(["Cat":4, "Dog":4, "Human":2, "Snake":0, "Ape":2, "Worm":0]) { $1 <= 2 }
result



