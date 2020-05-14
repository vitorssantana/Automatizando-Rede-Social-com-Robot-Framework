*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource    ../global_variables.robot
Resource    ../../pom/system/feed_page.robot
Resource    ../../pom/authentication/login_page.robot
Resource    ../../pom/authentication/login_page.robot

*** Keywords ***
Abrindo browser e logando com usuario "${email}" "${password}"
    Open Browser    ${URL_LOGIN}  ${BROWSER}
    Preencher Dados Login  ${email}  ${password}
    Clicar Botao Login
    Go To   ${URL_FEED} 

Fechando browser
    Close Browser

Clico no link para ver meu profile
    Clicar view my profile

Tento ver a lista de following
    Clicar link following

Tento ver a lista de followers
    Clicar link followers

Devo ver os usuarios da ${lista} na tela
    FOR    ${user}    IN    @{lista}
        Page Should Contain     ${user}
    END

Crio um novo post "${message}"
    Digitar Novo Post  ${message}
    Postar post no feed

Devo ver o post "${message}" no meu feed
    Page Should Contain     ${message}

Tento deletar o post "${message}"
    Deletar post    ${message}

Devo parar de ver o post "${message}" na tela
    Page Should Not Contain     ${message}

Vejo um post do user "${user}" e entro no seu profile
    Entrar profile user     ${user}

Devo ver a tela de profile do usuario "${user_name}", "${user_id}"
    ${url_atual}    Get Location
    Should Match Regexp    ${url_atual}    https://positiveness.herokuapp.com/users/${user_id}
    Page Should Contain     ${user_name}
    