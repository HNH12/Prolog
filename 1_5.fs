// Learn more about F# at http://fsharp.org

let delit a b =
    if (a%b=0) then false
    else true

let rec prost a b =
    if a = b then true
    else (delit a b) && (prost a (b+1))

let pr a =
    match a with
    |1-> false
    |_-> prost a 2


let pr1_5 = 
    System.Console.WriteLine("Введите число: ")
    let a = System.Convert.ToInt32(System.Console.ReadLine())
    (pr a)

[<EntryPoint>]
let main argv =

    let Answer = pr1_5
    System.Console.WriteLine(Answer)

    0 // return an integer exit code
