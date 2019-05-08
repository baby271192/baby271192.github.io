
<meta charset="utf-8"> 
<?php
$urok="Урок 22";
error_reporting( E_ERROR );   //Отключение предупреждений и нотайсов (warning и notice) на сайте
// создание переменных из полей формы		
if (isset($_POST['your-name']))			{$your-name			= $_POST['your-name'];		if ($your-name == '')	{unset($your-name);}}


if (isset($_POST['message']))			{$message			= $_POST['message'];		if ($message == '')	{unset($message);}}


if (isset($_POST['submit']))			{$submit			= $_POST['submit'];		if ($submit == '')		{unset($submit);}}


//стирание треугольных скобок из полей формы
if (isset($your-name) ) {
$your-name=stripslashes($your-name);
$your-name=htmlspecialchars($your-name);
}
if (isset($message) ) {
$message=stripslashes($message);
$message=htmlspecialchars($message);
}
// адрес почты куда придет письмо
$address="alexandr.protik@gmail.com";
// текст письма 
$note_text="Тема : $urok \r\nИмя : $your-name \r\n Email : $email1 \r\n Дополнительная информация : $message";

if (isset($your-name)  &&  isset ($submit) ) {
mail($address,$urok,$note_text,"Content-type:text/plain; windows-1251"); 
// сообщение после отправки формы
echo "<p style='color:#009900;'>Уважаемый(ая) <b>$name1</b> Ваше письмо отправленно успешно. <br> Спасибо. <br>Вам скоро ответят на почту <b> $email1</b>.</p>";
}

?>