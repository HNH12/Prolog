// Learn more about F# at http://fsharp.org

let rec nod a b =
    if (b = 0) then a
    else nod b (a%b)

let rec eil a b k =
    match b with
    |0->k
    |_-> if (nod a b = 1) then eil a (b-1) (k+1)
         else eil a (b-1) k

let eiler a = eil a (a-1) 0

let pr1_10 = 
    System.Console.WriteLine("Введите число: ")
    let n = System.Convert.ToInt32(System.Console.ReadLine())
    eiler n

[<EntryPoint>]
let main argv = 

    let answer = pr1_10
    System.Console.WriteLine(answer)

    0 // return an integer exit code