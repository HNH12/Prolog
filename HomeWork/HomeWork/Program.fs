// Learn more about F# at http://fsharp.org

open System

let rec read_list n =
    if n=0 then []
    else
    let head = Convert.ToInt32(System.Console.ReadLine())
    let tail = read_list(n-1)
    head::tail

let rec read_data =
    let n = Convert.ToInt32(System.Console.ReadLine())
    read_list n

let rec write_list list =
    match list with
    |[] -> 0
    |h::t -> System.Console.WriteLine(h.ToString())
             write_list t


// 13.1
//let prov h = h%2=0

//let rec prog h list =
//    match list with
//    |[] -> h
//    |head::tail -> if (prov head = prov h) && (head>h) then prog head tail
//                                                       else prog h tail

//let main_prog list =
//    match list with
//    |[]-> 0
//    |head::tail -> prog head tail

// 13.2
//let rec check_repeat el list k=
//    match list with
//    |[] -> k
//    |head::tail -> if (head = el) then check_repeat el tail (k+1)
//                   else check_repeat el tail k

//let rec prog list list1 el count_repeat = 
//    match list with
//    |[] -> el
//    |head::tail -> let k = check_repeat head list1 0
//                   if (k > count_repeat) then prog tail list1 head k
//                   else prog tail list1 el count_repeat

//let main_prog list = 
//    match list with
//    |[]-> 0
//    |head::tail -> prog tail list head (check_repeat head list 0)
    
// 13.3
//let rec check_repeat el list k=
//    match list with
//    |[] -> k
//    |head::tail -> if (head = el) then check_repeat el tail (k+1)
//                   else check_repeat el tail k

//let main_check el list = ((check_repeat el list 0)%2=0) && el%2=0

//let rec prog list list1= 
//    match list with
//    |[] -> []
//    |head::tail -> let t = prog tail list1
//                   if ((main_check head list1) && (check_repeat head t 0 = 0)) then head::t
//                   else t

//let main_prog list = 
//    prog list list

// 13.4
//let rec check_sum_digit el sum =
//    match el with
//    |0 -> sum
//    |_ -> check_sum_digit (el/10) (sum+(el%10))

//let rec prog list =
//    match list with
//    |[]->[]
//    |head::tail -> let t = prog tail
//                   if ((head>0)&&((check_sum_digit head 0)<10)) then head::t
//                   else t

//let main_prog list =
//    prog list

// 13.5
//let rec check_sq_elem el list =
//    match list with
//    |[]->false
//    |head::tail -> if (head*head=el) then true
//                   else check_sq_elem el tail

//let rec prog list list1 k=
//    match list with
//    |[]-> k
//    |head::tail -> if (check_sq_elem head list1) then prog tail list1 k+1
//                   else prog tail list k

//let main_prog list=
//    prog list list 0

// 13.6
//let rec sum_elem list =
//    match list with
//    |[] -> 0
//    |head::tail -> head + (sum_elem tail)

//let rec append el list =
//    match list with
//    |[]-> [el]
//    |head::tail->let t = append el tail
//                 head::t

//let rec prog list k n current_list max_list max_sum const_list=
//    match list, k, current_list, const_list with
//    |[],_,[],_ -> max_list
//    |[],n,_,_ -> let current_sum = sum_elem current_list
//                 if (current_sum > max_sum) then current_list
//                 else max_list
//    |head::tail,k,_,const_head::const_tail -> if (k=n) then let current_sum = sum_elem current_list
//                                                            if (current_sum > max_sum) then prog const_tail 0 n [] current_list current_sum const_tail
//                                                            else prog const_tail 0 n [] max_list max_sum const_tail
//                                              else let new_list = append head current_list
//                                                   prog tail (k+1) n new_list max_list max_sum const_list

//let main_prog list=
//    System.Console.WriteLine("Введите длину подсписка")
//    let n = Convert.ToInt32(System.Console.ReadLine())
//    prog list 0 n [] [] 0 list

// 13.7


[<EntryPoint>]
let main argv =
    let list = read_data
    let ans = main_prog list 
    write_list ans
    0 // return an integer exit code
