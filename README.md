# Ferias_ldap
Script para automatizar a desativação/ativação de usuários em ferias no Active Directory, caso não queria desativar a conta, também tem a opção de mover de o.u, ficando a seu critério!

A variável Date , pega a data atual.<br>
A yesterday , pega a data atual -1 dia no padrão que você achar melhor, optei por dia/mês/ano

Será necessário ter um arquivo .csv ou .txt , onde passei os seguintes campos :

Nome,usuario,datainic,datafim,Path<br>
Jose Silva,jose.silva,27/02/2023,27/03/2023,"OU=SETOR,DC=seudominio,DC=com,DC=br"

O script vai funcionar da seguinte forma : <br>
Com base nas datas ele vai comparar, se o dia de inicio das férias for igual ao dia que esta sendo executado, então ele vai pegar o usuário,
mover para a OU=FERIAS , se o usuário for voltar de férias dia 28/03, então a data de retorno no arquivo precisa ser um dia antes, assim, quando for dia 28/03 o script vai verificar se tem algum usuário com a data um dia antes, sendo 27/03 e vai mover ele de volta a OU original dele.

Caso não queria fazer essa movimentação de O.Us, pode então optar por apensa desativar e ativar a conta, substituindo o codigo dentro do if, sendo para desativar :<br>
Disable-ADAccount jose.silva
<br>
e para reativar : Enable-ADAccount jose.silva