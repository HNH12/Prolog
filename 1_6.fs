// Learn more about F# at http://fsharp.org

let rec chains n k =
    match n with
    |1->k
    |_-> if (n%2=0) then chains (n/2) (k+1)
         else chains (3*n+1) (k+1)
        

let rec max_posled n a k = 
    match n with
    |1000000->(a,k)
    |_-> let k1 = chains n k 
         let k2 = chains a k 
         if (k1 > k2) then max_posled (n+1) n k1
         else max_posled (n+1) a k2  

let pr1_6 = max_posled 1 1 1

[<EntryPoint>]
let main argv = 

    let answer = pr1_6
    System.Console.WriteLine(answer)

    0 // return an integer exit code