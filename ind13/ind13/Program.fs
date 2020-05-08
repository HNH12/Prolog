// Learn more about F# at http://fsharp.org

open System

let rec read_list n = 
    if n=0 then []
    else
    let Head = System.Convert.ToInt32(System.Console.ReadLine())
    let Tail = read_list (n-1)
    Head::Tail

let read_data = 
    System.Console.WriteLine("Введите длину списка: ")
    let n=System.Convert.ToInt32(System.Console.ReadLine())
    System.Console.WriteLine("Введите список: ")
    read_list n

let rec write_list list = 
    match list with
    |[] -> 0
    |h::t -> System.Console.WriteLine(h.ToString())
             write_list t

let rec find_repeat el list count=
    match list with
    |[]-> count
    |head::tail -> if (head = el) then find_repeat el tail (count+1)
                   else find_repeat el tail count

let rec find_max_repeat el list const_list max_repeat=
    match list with
    |[]-> el
    |head::tail -> let repeat = find_repeat head const_list 0
                   if (repeat > max_repeat) then find_max_repeat head tail const_list repeat
                   else find_max_repeat el tail const_list max_repeat

let rec append el list =
    match list with
    |[]->[el]
    |head::tail -> let t = append el tail
                   head::t

let rec delete_all el list new_list = 
    match list with
    |[]->new_list
    |head::tail -> if (head=el) then delete_all el tail new_list
                   else delete_all el tail (append head new_list)

let rec take_all_elem el list =
    match list with
    |[] -> []
    |head::tail -> let t = take_all_elem el tail
                   if (head = el) then head::t
                   else t

let rec append_list first_list second_list =
    match first_list with
    |[] -> second_list
    |head::tail -> append_list tail (append head second_list)

let rec form_list list new_list =
    match list with
    |[]->new_list
    |head::tail -> let current_max_elem = find_max_repeat head tail tail (find_repeat head list 0)
                   form_list (delete_all current_max_elem list []) (append_list (take_all_elem current_max_elem list) new_list)

let main_prog list=
    form_list list []

[<EntryPoint>]
let main argv =
    let list = read_data
    let ans = main_prog list
    System.Console.WriteLine("\nИзмененнный список:")
    write_list ans
    printfn "Hello World from F#!"
    0 // return an integer exit code
