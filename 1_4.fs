// Learn more about F# at http://fsharp.org

let rec fib n =
    match n with
    |1->1
    |2->1
    |_->fib(n-1)+fib(n-2)

let pr1_4 =
    System.Console.WriteLine("Введите число: ")
    let a = System.Convert.ToInt32(System.Console.ReadLine())
    (fib a)

[<EntryPoint>]
let main argv =

    let Answer = pr1_4
    System.Console.WriteLine(Answer)

    0 // return an integer exit code
