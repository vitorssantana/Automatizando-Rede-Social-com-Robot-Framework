*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource    ../global_variables.robot
Resource    ../../pom/authentication/sign_up_page.robot

*** Keywords ***
Entrando no link do Sign up
    Open Browser    ${URL_SIGN_UP}  ${BROWSER}

Fechando browser
    Close Browser

Tento cadastrar o user "${name}", "${email}", "${password}", "${password_confirmation}"
    Preencher Dados Usuario     ${name}     ${email}    ${password}     ${password_confirmation}
    Clicar Botao Create my Account

Devo ver mensagem "${message}"
    Page Should Contain     ${message}

Devo ver a tela de home
    ${url_atual}    Get Location
    Should Match Regexp    ${url_atual}    https://positiveness.herokuapp.com/
    Page Should Contain Element     class:btn-primary