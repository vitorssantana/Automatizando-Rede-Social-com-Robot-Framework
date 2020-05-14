*** Settings ***
Documentation   O usuario esta na tela de feed e pode ver os posts de quem ele segue, alem de poder fazer um post novo ou deletar um
Resource    ../../resources/system/feed_steps.robot
Test Setup  Abrindo browser e logando com usuario "test@test.com" "test123"
Test Teardown  Fechando browser

*** Variables ***
@{list_following}      Example User    Dra. Morgana Moraes     Víctor Moraes 
@{list_followers}      Teste Automacao Vitor   Teste Automacao Vitor   

*** Test Cases ***

Ver meu proprio profile
    Clico no link para ver meu profile
    Devo ver a tela de profile do usuario "Rails Test", "106"

Acessar a lista de following
    Tento ver a lista de following
    Devo ver os usuarios da ${list_following} na tela

Acessar a lista de followers
    Tento ver a lista de followers
    Devo ver os usuarios da ${list_followers} na tela

Realizar um novo post
    Crio um novo post "Teste Postagem"
    Devo ver o post "Teste Postagem" no meu feed

Deletar comentario
    Crio um novo post "Teste Tela Feed"
    Tento deletar o post "Teste Tela Feed"
    Devo parar de ver o post "Teste Tela Feed" na tela

Entrar no profile de um usuario cujo post aparece no feed
    Vejo um post do user "Example User" e entro no seu profile
    Devo ver a tela de profile do usuario "Example User", "6"    