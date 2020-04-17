// Learn more about F# at http://fsharp.org

let rec fact n =
    match n with
    | 1->1
    | _->n*fact(n-1)

let pr1_3 =
    System.Console.WriteLine("Введите число: ")
    let a = System.Convert.ToInt32(System.Console.ReadLine())
    (fact a)

[<EntryPoint>]
let main argv =

    let Answer = pr1_3
    System.Console.WriteLine(Answer)

    0 // return an integer exit code
