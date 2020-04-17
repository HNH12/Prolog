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

let rec m_p_d a b =
    match b with
    |1->1
    |_-> if (pr b && not(delit a b)) then b
         else m_p_d a (b-1)

let max_pr_del a = m_p_d a a
    

let pr1_8 = 
    System.Console.WriteLine("Введите число")
    let a = System.Convert.ToInt32(System.Console.ReadLine())
    max_pr_del a


[<EntryPoint>]
let main argv = 

    let answer = pr1_8
    System.Console.WriteLine(answer)

    0 // return an integer exit code