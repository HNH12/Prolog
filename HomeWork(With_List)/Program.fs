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



[<EntryPoint>]
let main argv =
    let list = read_data
    let ans = prog list
    Console.WriteLine(ans.ToString())
    0 // return an integer exit code

