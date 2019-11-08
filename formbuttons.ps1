Add-Type -assembly System.Windows.Forms

$window_form = New-Object System.Windows.Forms.Form

#$FormLabel3 = New-Object System.Windows.Forms.Label
#$FormLabel3.Text = ""
#$FormLabel3.Location = New-Object System.Drawing.Point(300,70)
#$FormLabel3.AutoSize = $true
#$window_form.Controls.Add($FormLabel3)

$FormButton = New-Object System.Windows.Forms.Button
$FormButton.Location = New-Object System.Drawing.Size(0,50)
$FormButton.Size = New-Object System.Drawing.Size(200,60)
$FormButton.Text = "Перезапустить qlikviewserver"
$window_form.Controls.Add($FormButton)

$FormButton1 = New-Object System.Windows.Forms.Button
$FormButton1.Location = New-Object System.Drawing.Size(0,100)
$FormButton1.Size = New-Object System.Drawing.Size(200,60)
$FormButton1.Text = "Перезапустить qlikvieweb"
$window_form.Controls.Add($FormButton1)

$TextBox = New-Object System.Windows.Forms.label
$TextBox.Location  = New-Object System.Drawing.Point(0,170)
$TextBox.Site = New-Object System.Drawing.Size(150,500)
$TextBox.Text = 'Опять работа?'
$window_form.Controls.Add($TextBox)


window_form.AutoSize = $true

$FormButton.Add_Click(
{
$qlikrestart= Restart-Service -Name QlikviewServer
$qlikstart=Start-Service -name QlikviewServer
$textbox.text = ''
$qlikrestart
sleep(1)
$qlikstart
$textbox.text = 'Работаю'
sleep(5)
$textbox.text ='Дело сделано'
sleep(1)
$textbox.text = 'Опять работа?'

})

$FormButton1.Add_Click(
{
$webrestart= Restart-Service -Name QlikviewWebserver
$webrestart=Start-Service -name QlikviewWebserver
$textbox.text = ''
$qlikrestart
sleep(1)
$textbox.text = 'Работаю'
$qlikstart
sleep(3)
$textbox.text ='Дело сделано'
sleep(1)
$textbox.text = 'Опять работа?'

})


$window_form.ShowDialog() | Out-Null
