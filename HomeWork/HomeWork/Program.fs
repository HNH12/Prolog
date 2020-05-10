// Learn more about F# at http://fsharp.org

open System

let rec read_list n =
    if n=0 then []
    else
    let head = Convert.ToInt32(System.Console.ReadLine())
    let tail = read_list(n-1)
    head::tail

//let rec read_data =
//    let n = Convert.ToInt32(System.Console.ReadLine())
//    read_list n

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

let rec find_max list elem =
    match list with
    |[] -> elem
    |head::tail -> if (head>elem) then find_max tail head
                   else find_max tail elem

let rec delete_elem list elem =
    match list with
    |[] -> []
    |head::tail -> let t = delete_elem tail elem
                   if head = elem then t
                   else head::t

let rec append el list =
    match list with
    |[]->[el]
    |head::tail -> let t = append el tail
                   head::t

let rec sort_list_A list new_list =
    match list with
    |[] -> new_list
    |head::tail -> let max_elem = find_max list (find_max list head)
                   sort_list_A (delete_elem list max_elem) (append max_elem new_list)

let rec sum_digit el sum=
    match el with
    |0 -> sum
    |_ -> sum_digit (el/10) (sum+el%10)

let rec find_min_numb list min_numb =
    match list with
    |[] -> min_numb
    |head::tail -> let new_sum = sum_digit (abs(head)) 0
                   let current_sum = sum_digit (abs(min_numb)) 0
                   if (new_sum < current_sum) then find_min_numb tail head
                   else find_min_numb tail min_numb

let rec sort_list_B list new_list =
    match list with
    |[] -> new_list
    |head::tail -> let min_elem = find_min_numb list (find_min_numb list head)
                   sort_list_B (delete_elem list min_elem) (append min_elem new_list)

let rec count_delit el delit count =
   match delit=el with
   |true -> count+1
   |false -> if (el%delit = 0) then count_delit el (delit+1) (count+1)
             else count_delit el (delit+1) count

let rec find_max_delit_count list elem =
    match list with
    |[] -> elem
    |head::tail -> let new_count = count_delit (abs(head)) 1 0
                   let current_count = count_delit (abs(elem)) 1 0
                   if (new_count > current_count) then find_max_delit_count tail head
                   else find_max_delit_count tail elem

let rec sort_list_C list new_list = 
    match list with
    |[] -> new_list
    |head::tail -> let max_elem = find_max_delit_count list (find_max_delit_count list head) 
                   sort_list_C (delete_elem list max_elem) (append max_elem new_list)

let rec elem_index list index i elem =
    match list, index=i with
    |_,true -> elem
    |[],_ -> 0
    |head::tail,_-> elem_index tail index (i+1) head

let rec first_elem list=
    match list with
    |[] -> 0
    |[head]->head
    |head::tail -> first_elem tail

let rec form_cortezh f_list s_list t_list new_list i index=
    if (i=index) 
    then new_list
    else    let f_elem_i = elem_index f_list i 0 (first_elem f_list)
            let s_elem_i = elem_index s_list i 0 (first_elem s_list)
            let t_elem_i = elem_index t_list i 0 (first_elem t_list)
            let new_elem_cortezh = append (f_elem_i,s_elem_i,t_elem_i) new_list
            form_cortezh f_list s_list t_list new_elem_cortezh (i+1) index


let max a b =
    if (a>b) then a
    else b

let main_prog f_list s_list t_list n =
    form_cortezh (sort_list_A f_list []) (sort_list_B s_list []) (sort_list_C t_list []) [] 1 (n+1)

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
    let ans = main_prog f_list s_list t_list (max (max n1 n2) n3)
    write_list ans
    0 // return an integer exit code
