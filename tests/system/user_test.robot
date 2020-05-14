*** Settings ***
Documentation   O usuario esta na sua tela inicial e pode ver e remover todos os seus posts, alem de ver a lista de seguidores e de quem o segue
Resource    ../../resources/system/user_steps.robot
Test Setup  Abrindo browser e logando com usuario "test@test.com" "test123"
Suite Setup     Postando o comentario "Test User" na conta "test@test.com" "test123"
Test Teardown  Fechando browser

*** Variables ***
@{list_following}      Example User    Dra. Morgana Moraes     Víctor Moraes 
@{list_followers}      Teste Automacao Vitor   Teste Automacao Vitor   

*** Test Cases ***
Acessar a lista de following
    Tento ver a lista de following
    Devo ver os usuarios da ${list_following} na tela

Acessar a lista de followers
    Tento ver a lista de followers
    Devo ver os usuarios da ${list_followers} na tela

Deletar comentario
    Tento deletar o post "Test User"
    Devo parar de ver o post "Test User" na tela

Parar de seguir user
    Entro no profile do user "6"
    Deixo de segui-lo
    Devo parar de ver o user "Example User" na minha lista de following

Seguir user
    Entro no profile do user "6"
    Sigo para ver os seus posts no meu feed
    Devo ver o post "Now you are following Example User" no meu feed
    Devo ver o user "Example User" na minha lista de following
    