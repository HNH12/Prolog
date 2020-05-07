// Learn more about F# at http://fsharp.org

open System

let rec read_list n = 
    if n=0 then []
    else
    let Head = System.Convert.ToInt32(System.Console.ReadLine())
    let Tail = read_list (n-1)
    Head::Tail

let read_data = 
    let n=System.Convert.ToInt32(System.Console.ReadLine())
    read_list n

let rec write_list list = 
    match list with
    |[] -> let z = System.Console.ReadKey()
           0
    |h::t -> System.Console.WriteLine(h.ToString())
             write_list t

let rec find_repeat el list=
    match list with
    |[] -> 0
    |head::tail -> if (head = el) then (find_repeat el tail)+1
                   else find_repeat el tail

let rec find_max_repeat list list1 max_el max_repeat=
    match list with
    |[] -> max_el
    |head::tail -> let count = find_repeat head list1
                   if (count > max_repeat) then find_max_repeat tail list1 head count
                   else find_max_repeat tail list1 max_el max_repeat

let rec append el list =
    match list with
    |[]-> el
    |head::tail->let t = append el tail
                 head::t

let rec append_all_el el list new_list =
    match list with
    |[] -> new_list
    |head::tail -> if (head = el) then let list1 = append head new_list
                                       append_all_el el tail list1
                   else append_all_el el tail new_list

let rec new_list_without_el el list=
    match list with
    |[] -> []
    |head::tail -> let t = new_list_without_el el tail
                   if (head = el) then t
                   else head::t

let rec form_list list new_list = 
    match list with
    |[] -> new_list
    |head::tail -> let max_elem = find_max_repeat list list head 0
                   let b = append_all_el max_elem list new_list
                   let c = new_list_without_el max_elem list
                   form_list c b

let main_prog list =
    form_list list []

[<EntryPoint>]
let main argv =
    let list = read_data
    let ans = main_prog list
    System.Console.WriteLine(ans);
    printfn "Hello World from F#!"
    0 // return an integer exit code
