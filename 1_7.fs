// Learn more about F# at http://fsharp.org

let rec mult a =
    if (a/10 = 0) then a
    else a%10 * mult(a/10)

let rec sum a =
    match a with
    |0->0
    |_->a%10 + sum (a/10)

let funct f a = f a

let pr1_7 =
    System.Console.WriteLine("Введите число: ")
    let a = System.Convert.ToInt32(System.Console.ReadLine())
    (funct mult a, funct sum a)

[<EntryPoint>]
let main argv = 

    let answer = pr1_7
    System.Console.WriteLine(answer)

    0 // return an integer exit code