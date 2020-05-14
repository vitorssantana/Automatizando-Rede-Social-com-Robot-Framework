*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource    ../global_variables.robot
Resource    ../../pom/system/user_page.robot
Resource    ../../pom/system/feed_page.robot
Resource    ../../pom/authentication/login_page.robot

*** Keywords ***
Abrindo browser e logando com usuario "${email}" "${password}"
    Open Browser    ${URL_LOGIN}  ${BROWSER}
    Preencher Dados Login  ${email}  ${password}
    Clicar Botao Login

Postando o comentario "${texto}" na conta "${email}" "${password}"
    Open Browser    ${URL_LOGIN}  ${BROWSER}
    Preencher Dados Login  ${email}    ${password}
    Clicar Botao Login
    Go To     ${URL_FEED}
    Digitar Novo Post  ${texto}
    Postar post no feed
    Close Browser

Fechando browser
    Close Browser

Tento ver a lista de following
    user_page.Clicar link following

Tento ver a lista de followers
    user_page.Clicar link followers    

Devo ver os usuarios da ${lista} na tela
    FOR    ${user}    IN    @{lista}
        Page Should Contain     ${user}
    END
    
Tento deletar o post "${mensagem}"
    user_page.Deletar post    ${mensagem}

Devo parar de ver o post "${mensagem}" na tela    
    Page Should Not Contain     ${mensagem}

Entro no profile do user "${user_id}"
    Go To     ${URL_FEED}/users/${user_id}
    
Deixo de segui-lo
    user_page.Clicar Botao Unfollow
    
Devo parar de ver o user "${user_name}" na minha lista de following
    Go To     ${URL_FEED}
    feed_page.Clicar link following
    Page Should Not Contain     ${user_name}

Sigo para ver os seus posts no meu feed
    user_page.Clicar Botao Follow

Devo ver o post "${message}" no meu feed
    Go To     ${URL_FEED}
    Page Should Contain     ${message}

Devo ver o user "${user_name}" na minha lista de following
    feed_page.Clicar link following   
    Page Should Contain     ${user_name}