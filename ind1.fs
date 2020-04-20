// Learn more about F# at http://fsharp.org
let delit a b =
    if (a%b=0) then false
    else true

let rec prost a b =
    if a = b then true
    else (delit a b) && (prost a (b+1))

let pr a =
    match a with
    | 1 -> false
    | _ -> prost a 2
    
let max_count_pr a b =
    let mutable flag = true
    let mutable cur_a = a
    let mutable cur_b = b
    let mutable n = 0
    while flag do
        let rez = n*n+a*n+b
        if (pr rez) then n <- n+1
        else flag <- false
    n

let mnogochlen =
    let mutable max_a = 0
    let mutable max_b = 0
    let mutable max_k = 0
    for a in 0..30 do
        for b in 0..30 do
            let count = max_count_pr a b
            if (count > max_k) then max_a <-a
                                    max_b <-b
                                    max_k <-count
    (max_a,max_b,max_k)

let ind1 = mnogochlen

//let rec f a b =
//    match a,b with
//    |0,0 -> System.Console.WriteLine("конец")
//    |_,0-> System.Console.WriteLine("{0}, {1}", a,b)
//           f (a-1) 3
//    |_,_-> System.Console.WriteLine("{0}, {1}", a,b)
//            f (a-1) (b-1)

[<EntryPoint>]
let main argv = 

    let answer = ind1
    System.Console.WriteLine(answer)
    0 // return an integer exit code