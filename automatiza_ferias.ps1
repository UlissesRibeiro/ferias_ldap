$Date = Get-Date -format d
$yesterday = (Get-Date).adddays(-1).ToString("dd/MM/yyyy")

Import-Csv "path\automatiza_ferias.txt" | ForEach-Object {

if ($_.datainic -eq $Date){

Get-ADUser $_.usuario | Move-ADObject -TargetPath "OU=FERIAS,DC=seudominio,DC=com,DC=br"
}
if ($_.datafim -eq $yesterday){

Get-ADUser $_.usuario | Move-ADObject -TargetPath $_.Path

}

}