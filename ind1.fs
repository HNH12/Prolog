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

let rec max_count_pr a b k flag =
    match flag with
    | 0 -> k
    | 1 -> let rez = k*k+a*k+b
           if (pr rez) then max_count_pr a b (k+1) 1
           else max_count_pr a b k 0

let rec mnogochlen a b max_a max_b max_k=
    match a,b with
    | 1000, 1000 -> (max_a, max_b, max_k, max_a*max_b)
    | _, 1000 -> mnogochlen (a+1) 0 max_a max_b max_k
    | _,_ -> let count = max_count_pr a b 0 1
             if (count > max_k) then mnogochlen a (b+1) a b count
             else mnogochlen a (b+1) max_a max_b max_k

let ind1 = mnogochlen 0 0 10 10 0

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