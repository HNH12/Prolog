// Learn more about F# at http://fsharp.org

let rec nod a b =
    if (b = 0) then a
    else nod b (a%b)

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