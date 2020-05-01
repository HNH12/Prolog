// Learn more about F# at http://fsharp.org

open System
open System.Drawing
open System.Windows.Forms

let MainForm = new Form(Width=400, Height=300, Text = "Индивидуальное задание Шрёдингера", Menu = new MainMenu())

let buttonCheck = new Button(Text = "Проверка", Width=100, Height=50)
buttonCheck.Location <- new Point(75, 100)
MainForm.Controls.Add(buttonCheck)

let q1 = new CheckBox(Text = "первый флажок")
q1.Location <- new Point(90,30);
let q2 = new CheckBox(Text = "второй флажок")
q2.Location <- new Point(210,30);
MainForm.Controls.Add(q1)
MainForm.Controls.Add(q2)

buttonCheck.Click.Add(fun evArgs -> 
    match q1.Checked with
    |true -> if (q2.Checked) then MessageBox.Show("Установлены оба флажка")
             else MessageBox.Show("Установлен первый флажок");
    |false -> if (q2.Checked) then MessageBox.Show("Установлен второй флажок")
              else MessageBox.Show("Не установлены флажки")
    |> ignore)

do Application.Run(MainForm)