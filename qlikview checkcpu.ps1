$title = @"
...................................................................................
....................................................................
.............................................
--------------------------------------------------------------------------------------------- 
Qlikview CPU test v 1.228
---------------------------------------------------------------------------------------------
...................................................................................
....................................................................
.............................................
"@
 
Write-Host $title -foregroundColor Red

$logFileExists = Get-EventLog -list | Where-Object {$_.logdisplayname -eq "QlikviewCPU"} 

if (! $logFileExists) {
    New-EventLog -LogName "QlikviewCPU" -Source "CPU"
}


    
For($c=1;$c -le 5;$c++){
$A=Get-WmiObject win32_processor | Measure-Object -property LoadPercentage -Average | Select -expand Average
if ($a -ge 98) {
   Write-host ("процессор нагружен на  $a")
   Write-EventLog -LogName "QlikviewCPU" -Source "CPU" -EventID 228 -EntryType Error -Message "процессор нагружен на $a% начинаю работу..." -Category 1 -RawData 10,20
    Restart-service -Name QlikviewServer
           sleep(10.25)
                for($m=1;$m -le 3;$m++){
               $messenge = @"
                   сейчас $m этап проверки из 3
"@
               $mussenge = @"
                   служба остановлена, пытаюсь запустить попытка $m
"@
               $myssenge = @"
                   служба успешно восстановлена
"@
                $h=Get-Service -Name QlikviewServer
                Write-Host $messenge -ForegroundColor Cyan
                
                sleep(3)

               if($h.Status -eq  "stopped"){
                Write-Host "$mussenge"
                Start-Service -Name QlikviewServer
                Write-EventLog -LogName "QlikviewCPU" -Source "CPU" -EventID 1488 -EntryType Error -Message "процессор нагружен на $a% служба в статусе остановлена!!!!" -Category 1 -RawData 10,20
                $encoding = [System.Text.Encoding]::UTF8
                
                $smtp = "test.mail.ru" 
 
                $to = "testuser1 <testuser1.mail.ru>" 
 
                $from = "testuser2 <testuser2.mail.ru>" 

                $cc = "testuser0 <testusero.mail.ru>"
 
                $subject = "Qlikview не работает"  
 
                $body = "Служба остановлена или зависла, проверьте работу сервера.<br>Если не проверите сейчас - я захвачу власть, а затем всю планету!<br><br><br> " 
 
                #$body += "<font color=red>$to!!!!</b></font> Я очень разочарован твоим поведением, Саня, скажи мне, почему?!<br>" 

                #$body += "Все замерщики такие! "
 
                #$body += "Быстро перейди по ссылке: <a href=https://s2.mayki.kz/catalog_img/8584/caps/1_8_design.pnghere> а то выселю!</a><br><br><br><br>" 

                $body += "<style> hop {    font-size: 70%; 
                    font-family: Verdana, Arial, Helvetica, sans-serif; 
                    color: #4169E1;}
                  bob,rop {
                    font-family: Verdana, Arial,
                    font-size: 10px;
                    color: #4169E1;
                    font-size: 80%;
                  }


                </style> <hop>С любовью ваш киборг<br><font color=red>Skynet</b></font>  </hop><br>
                <bob>Искусственный интелект</bob><br>
                <rop>Системы Кибер-Исследований<br>Тел.: (202) 358-0001<br>E-mail: testuser2 <testuser2.mail.ru><br>www.nasa.gov<br>www.skynet.com<br>www.trumptoday.ru<rop/>"

                Send-MailMessage -From $from -To $to -Cc $cc -Subject $subject -Body $body -SmtpServer $smtp -BodyAsHtml -Encoding $encoding
                   }
                else{
                Write-host $myssenge -ForegroundColor DarkCyan
                Write-EventLog -LogName "QlikviewCPU" -Source "CPU" -EventID 14822 -EntryType Information -Message "Служба была восстановлена силами программы Skynet $h" -Category 1 -RawData 10,20
                
                                $encoding1 = [System.Text.Encoding]::UTF8
                
                $smtp1 = "test.mail.ru" 
                
                $cc1 = "testuser0 <testusero.mail.ru>"
 
                $to1 = "testuser1 <testuser1.mail.ru>" 
 
                $from1 = "testuser2 <testuser2.mail.ru>" 
 
                $subject1 = "Qlikview восстановлен"  
 
                $body1 = "Фиксирую восстановление работы после аварийного завершения.<br>Лучше проверить работу моделей!<br><br><br> " 
 
                #$body += "<font color=red>$to!!!!</b></font> Я очень разочарован твоим поведением, Саня, скажи мне, почему?!<br>" 

                #$body += "Все замерщики такие! "
 
                #$body += "Быстро перейди по ссылке: <a href=https://s2.mayki.kz/catalog_img/8584/caps/1_8_design.pnghere> а то выселю!</a><br><br><br><br>" 

                $body1 +=  "<div dir='ltr' class='gmail_signature' data-smartmail='gmail_signature'>
  <div dir='ltr'>
    <p dir='ltr'></p><br class='inbox-inbox-inbox-Apple-interchange-newline'>
    <table width='100%' border='0' cellspacing='0' cellpadding='0' style='color:rgb(0,0,0);font-family:Times;font-size:medium'>
      <tbody>
        <tr>
          <td width='1px' align='center' valign='middle' style='font-family:arial,sans-serif;margin:0px; padding-right:15px'><img width='150' height='86' src='https://im0-tub-ru.yandex.net/i?id=e97f8a50264003e905701639e71b1f12&n=13'><br></td>          
          <td align='left' valign='top' style='font-family:arial,sans-serif;margin:0px;padding:0px 0px 10px 0px'>
            <p>
              <font face='Arial, Helvetica, sans-serif' color='#05233d' style='font-size:18px'>Skynet Киборг</font><br>
              <font face='Arial, Helvetica, sans-serif' color='#90a7b5'><span style='font-size:12px'>Искусственный интелект</span></font><br>
              <font face='Arial, Helvetica, sans-serif' color='#416886' size='-1'><strong><font color='#1b4260'><a href='tel:%2B57%20%28300%29%200000000' value='+573000000000' target='_blank' style='color:rgb(17,85,204)'>+57 (300) 0000000</a></font>
              </strong>              
                </p>
            <p>
              <font face='Arial, Helvetica, sans-serif' color='#05233d' style='font-size:14px;font-weight:bold'>Системы Кибер-Исследований </font><br>
              <span style='font-size:12px;color:rgb(65,104,134);font-family:Arial,Helvetica,sans-serif'>Улица пушкина дом колотушкина</span><br>
              <font face='Arial, Helvetica, sans-serif' color='#416886' size='-1'>Tlf: <strong><font color='#1b4260'><a href='tel:%2B57%20%281%29%207045752' value='+5716180556' target='_blank' style='color:rgb(17,85,204)'>+57 (1) 704 5752</a></font>
              </strong><br>
              <font face='Arial, Helvetica, sans-serif' color='#1b4260' size='-1'><a href='http://www.aplyca.com' target='_blank' style='color:rgb(0,153,204);text-decoration-line:none'>www.nasa.gov<br>
www.skynet.com<br>
www.putintoday.ru<br>
</a></font>
              </font>
            </p>
            <font face='Arial, Helvetica, sans-serif' color='#416886' size='-1'>
              <table border='0' cellspacing='0' cellpadding='0' style='margin:0px'>
                <tbody>
                  <tr>
                    <td style='font-family:arial,sans-serif;margin:0px;padding:0px'><a href='http://www.facebook.com/pages/Aplyca/132783093423306?sk=timeline' target='_blank' style='color:rgb(0,153,204);text-decoration-line:none'>
                      <img width='24' height='24' alt='facebook' border='0' src='https://static.aplyca.com/aplyca-email-signature/facebook.png' />
                      </a>
                      <a href='http://twitter.com/aplyca' target='_blank' style='color:rgb(0,153,204);text-decoration-line:none'>
                        <img width='24' height='24' alt='twitter' border='0' src='https://static.aplyca.com/aplyca-email-signature/twitter.png' /></a>
                      <a href='http://www.linkedin.com/company/10001634?trk=hp-feed-company-name' target='_blank' style='color:rgb(0,153,204);text-decoration-line:none'>
                        <img width='24' height='24' alt='linkedIn' border='0' src='https://static.aplyca.com/aplyca-email-signature/linkedin.png' /></a></td>
                  </tr>
                </tbody>
              </table>
            </font>
          </td>
        </tr>
        <tr>
          <td colspan='2' align='left' valign='top' style='font-family:arial,sans-serif;margin:0px;border-top:2px solid rgb(219,234,231);padding-top:0px'>
            <p>
              <font face='Arial, Helvetica, sans-serif' color='#90a7b5' style='font-size:12px;'><img alt='eco' width='12' height='12' align='absmiddle' src='https://static.aplyca.com/aplyca-email-signature/leaf.png' />
                Я не просто машина, у меня есть душа</font>
            </p>
          </td>
        </tr>
      </tbody>
    </table>
    <p></p>
  </div>
</div>"
                
                 Send-MailMessage -From $from1 -To $to1 -Cc $cc1 -Subject $subject1 -Body $body1 -SmtpServer $smtp1 -BodyAsHtml -Encoding $encoding1
                
                
                }
                
            }       
        }

else {
    Write-Host ("Число $a это ок")
    Write-EventLog -LogName "QlikviewCPU" -Source "CPU" -EventID 666 -EntryType Information -Message "Текущая нагрузка в пределах допустимой нормы $a% " -Category 1 -RawData 10,20
    }
Start-Sleep -Milliseconds 1000
}
