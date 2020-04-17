// Learn more about F# at http://fsharp.org

let delit a b =
    if (a%b=0) then true
    else false

let rec nod1 a b c =
    if (delit a c && delit b c) then c
    else nod1 a b (c-1)

let nod a b =
    if (a > b) then nod1 a b b
    else nod1 a b a

let pr1_9 = 
    System.Console.WriteLine("Введите число")
    let a = System.Convert.ToInt32(System.Console.ReadLine())
    let b = System.Convert.ToInt32(System.Console.ReadLine())
    nod a b


[<EntryPoint>]
let main argv = 

    let answer = pr1_9
    System.Console.WriteLine(answer)

    0 // return an integer exit code