
<meta charset="utf-8"> 
<?php
$urok="Урок 22";
error_reporting( E_ERROR );   //Отключение предупреждений и нотайсов (warning и notice) на сайте
// создание переменных из полей формы		
if (isset($_POST['your-name']))			{$name1			= $_POST['your-name'];		if ($name1 == '')	{unset($name1);}}
if (isset($_POST['email1']))		{$email1		= $_POST['email1'];		if ($email1 == '')	{unset($email1);}}
if (isset($_POST['message']))			{$text			= $_POST['message'];		if ($text == '')	{unset($text);}}
if (isset($_POST['submit']))			{$sab			= $_POST['submit'];		if ($sab == '')		{unset($sab);}}
//стирание треугольных скобок из полей формы
if (isset($your-name) ) {
$name1=stripslashes($your-name);
$name1=htmlspecialchars($your-name);
}
if (isset($email1) ) {
$email1=stripslashes($email1);
$email1=htmlspecialchars($email1);
}
if (isset($message) ) {
$text=stripslashes($message);
$text=htmlspecialchars($message);
}
// адрес почты куда придет письмо
$address="alexandr.protik@gmail.com";
// текст письма 
$note_text="Тема : $urok \r\nИмя : $your-name \r\n Email : $email1 \r\n Дополнительная информация : $text";

if (isset($your-name)  &&  isset ($submit) ) {
mail($address,$urok,$note_text,"Content-type:text/plain; windows-1251"); 
// сообщение после отправки формы
echo "<p style='color:#009900;'>Уважаемый(ая) <b>$name1</b> Ваше письмо отправленно успешно. <br> Спасибо. <br>Вам скоро ответят на почту <b> $email1</b>.</p>";
}

?>