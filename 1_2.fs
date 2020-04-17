// Learn more about F# at http://fsharp.org

let max a b =
    if a > b then a
    else b

let funct f a b c =
    let f2 = max a b
    f f2 c

let pr1_2 =
    System.Console.WriteLine("Введите три числа: ")
    let a = System.Convert.ToInt32(System.Console.ReadLine())
    let b = System.Convert.ToInt32(System.Console.ReadLine())
    let c = System.Convert.ToInt32(System.Console.ReadLine())
    (funct max a b c)

[<EntryPoint>]
let main argv =

    let Answer = pr1_2
    System.Console.WriteLine(Answer)

    0 // return an integer exit code
