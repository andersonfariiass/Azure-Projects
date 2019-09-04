# Script Power Shell para criação de redes virtuais na cloud Azure
# Autor: Danilo Bastos
# Versão: 0.1
# Solictando ao operador o nome da subnet que será criada na VNet
$SubNetName = Read-Host "Informe o nome desejado para a subnet "
    $SubNetNameString = echo $SubNetName | Out-String
# Solicitando o bloco de ip's para a subnet que será criada
$PrefixDataNet = Read-Host "Informe o prefixo de rede que deseja atribuir a subnet (Ex.: 10.0.0.0/16)"
    $PrefixDataNetString = echo $PrefixDataNet | Out-String
# Variável de criação da subnet com as informações fornecidas pelo operador
    $CreateSubNet1 = New-AzVirtualNetworkSubnetConfig -Name $SubNetNameString -AddressPrefix $PrefixDataNetString

# Solicitando ao operador o nome da VNet que será criada
    $VNetName = Read-Host "Informe o nome que deseja atribuir a VNet"

# Atribuição ao Resource Group, listando ou criando um novo Rersource Group
        Write-Host "Você necessita atribuir a sua VNet a um resource group:"

            $OpcaoRG = Read-Host "Deseja listar o resources group existentes? Escolha: 1- Sim 2- Não"
                if ($OpcaoRG -eq "1") {

                    Get-AzResourceGroup | select ResourceGroupName
                    Write-Host ""
                    $RGName = Read-Host "Digite o nome do Resource Group que deseja alocar a VNet"
                }

                elseif ($OpcaoRG -eq "2") {

                    $RGName = Read-Host "Digite o nome do Resource Group que deseja alocar a VNet"                   
                }
        
        # Listagem e escolha da geolocalização do resource group  
        Write-Host "Escolha da geolocalização para criação do Resource Group"
            Write-Host ""    
            $OpcaoGEO = Read-Host "Deseja listar as localidades disponíveis? 1- Sim 2- Não"
            
            if ($OpcaoGEO -eq "1") {

                Get-AzLocation | select Location
                Write-Host ""
                $GEOName = Read-Host "Digite o nome da localização que deseja alocar a VNet"
            }

            elseif ($OpcaoGEO -eq "2") {

                $GEOName = Read-Host "Digite o nome da localização que deseja alocar a VNet"
            }
        
Write-Host "Criando os recursos solicitados. Aguarde..."

            New-AzVirtualNetwork -Name $VNetName -ResourceGroupName $RGName -Location $GEOName -Subnet $CreateSubNet1

            if ($? -eq "True") {

                Write-Host "Os recursos foram criados com sucesso!"
            }
            else {
                
                Write-Host "Erro! por favor tente novamente..."
            }
# END