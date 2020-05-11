// Learn more about F# at http://fsharp.org

open System
open System.Collections.Generic

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

//let check1 elem = elem%2 = 0
//let check2 elem = not(elem%2 = 0)

//let compare elem1 elem2 =
//    if (elem1 < elem2) then 1
//    else -1

//let prog list =
//    let sorted_list = List.sortWith compare list
//    if (list.[0] % 2 = 0) then List.find check1 sorted_list
//    else List.find check2 sorted_list

// 13.2

//let rec count_repeat list elem count =
//    if (List.isEmpty(list)) then count
//    else if (elem = list.Head) then count_repeat list.Tail elem (count+1)
//         else count_repeat list.Tail elem count

//let rec prog list list1 elem = 
//    if (List.isEmpty(list))  then elem
//    else if (count_repeat list1 list.Head 0 > count_repeat list1 elem 0) then prog list.Tail list1 list.Head
//         else prog list.Tail list1 elem

// 13.3

//let check1 elem = elem%2 = 0

//let rec check2 list elem count =
//    if (List.isEmpty(list)) then count
//    else if (list.Head = elem) then check2 list.Tail elem (count+1)
//         else check2 list.Tail elem count 

//let prog list =
//    List.filter (fun elem -> (check1 elem) && (check2 list elem 0 % 2 = 0)) list

// 13.4

//let rec sum_digit elem sum =
//    match elem with
//    |0->sum
//    |_ -> sum_digit (elem/10) (sum+elem%10)

//let prog list =
//    List.filter (fun elem -> (elem > 0) || (sum_digit (abs elem) 0 > 10)) list

// 13.5

//let rec sq_elem list elem =
//    if (List.isEmpty(list)) then false
//    else if (elem = list.Head * list.Head) then true
//         else sq_elem list.Tail elem

//let prog list =
//    (List.filter (fun elem -> sq_elem list elem) list).Length

// 13.7

let rec sum_digit elem sum =
    match elem with
    |0->sum
    |_ -> sum_digit (elem/10) (sum+elem%10)

let rec count_delit el delit count =
   match delit=el with
   |true -> count+1
   |false -> if (el%delit = 0) then count_delit el (delit+1) (count+1)
             else count_delit el (delit+1) count

let compare_f elem1 elem2 =
    if (elem1 < elem2)  then 1
    else -1

let compare_s elem1 elem2 =
    if (sum_digit (abs elem1) 0 > sum_digit (abs elem2) 0) then 1
    else -1

let compare_t elem1 elem2 =
    if (count_delit elem1 1 0 < count_delit elem2 1 0) then 1
    else -1

let rec form_cortezh f_list s_list t_list new_list i index = 
    
let max a b =
    if (a>b) then a
    else b

let prog f_list s_list t_list n =
    let sorted_f_list = List.sortWith compare_f f_list
    let sorted_s_list = List.sortWith compare_s s_list
    let sorted_t_list = List.sortWith compare_t t_list
    form_cortezh sorted_f_list sorted_s_list sorted_t_list new_list 0 n
    


[<EntryPoint>]
let main argv =
    printf "Введите длину первого списка: "
    let n1 = Convert.ToInt32(System.Console.ReadLine());
    printf "Введите первый список: \n"
    let f_list = read_list n1
    printf "Введите длину второго списка: "
    let n2 = Convert.ToInt32(System.Console.ReadLine());
    printf "Введите второй список: \n"
    let s_list = read_list n2
    printf "Введите длину третьего списка: "
    let n3 = Convert.ToInt32(System.Console.ReadLine());
    printf "Введите третий список: \n"
    let t_list = read_list n3
    printf "\nИтоговый список:\n"
    let ans = prog f_list s_list t_list (max (max n1 n2) n3)
    write_list ans
    0 // return an integer exit code

