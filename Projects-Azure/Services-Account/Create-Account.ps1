# Arquivo base para criação de Grupos de recursos
# Versão do PowerShell: 6.2
# Criando um grupo de recurso em powershell [localização: brazilsouth]
# Definindo variável de local e nome do grupo de recurso
$locale = "brazilsouth"
$resourcename = Read-Host "Digite um nome para o Resource Group "
Write-Host "Criando novo grupo de recursos na localização "$locale
    New-AzResourceGroup -Name $resourcename -Location $locale
If ($? -eq "True") {
    Write-Host "Grupo de recursos criado com sucesso!"
} # Fecha a primeira condição
Else {
    Write-Host "O grupo de recurso não foi criado!"
} # Fecha a segunda condição
# End

