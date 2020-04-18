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
    
let rec max_count_pr a b n k =
    match n with
    | 40 -> k
    | _ -> let rez = n*n+a*n+b
           if (pr rez) then max_count_pr a b (n+1) (k+1)
           else max_count_pr a b (n+1) k

let rec mnogochlen a b max_a max_b max_k=
    match a,b with
    | 1000, 1000 -> (max_a, max_b, max_k)
    | _, 1000 -> mnogochlen (a+1) -999 max_a max_b max_k
    | _,_ -> let count = max_count_pr a b 0 0
             if (count > max_k) then mnogochlen a (b+1) a b count
             else mnogochlen a (b+1) max_a max_b max_k

let ind1 = mnogochlen -999 -999 -999 -999 0

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