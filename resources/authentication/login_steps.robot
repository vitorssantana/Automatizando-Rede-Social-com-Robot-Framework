*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource    ../global_variables.robot
Resource    ../../pom/authentication/login_page.robot
Resource    ../../pom/system/user_page.robot

*** Keywords ***
Entrando no link da pagina de login
    Open Browser    ${URL_LOGIN}  ${BROWSER}

Fechando browser
    Close Browser

Clico no link para recuperar senha
    Clicar Link Forgot Password

Devo ver a tela de forgot password
    ${url_atual}    Get Location
    Should Match Regexp    ${url_atual}    https://positiveness.herokuapp.com/password_resets/new  
    Page Should Contain Element     id:password_reset_email
    Page Should Contain Element     ${btn_submit}    class:btn-primary
    
Clico no link para cadastrar novo user
    Clicar Link Sign Up

Devo ver a tela de Sign Up
    ${url_atual}    Get Location
    Should Match Regexp    ${url_atual}    https://positiveness.herokuapp.com/signup
    Page Should Contain Element     id:user_name
    Page Should Contain Element     id:user_email  
    Page Should Contain Element     id:user_password
    Page Should Contain Element     id:user_password_confirmation
    Page Should Contain Element     xpath://input[@value="Create my account"]
    
Tento logar com user "${login}", "${password}"
    Preencher Dados Login   ${login}    ${password}
    Clicar Botao Login

Devo ver a mensagem "${message}"
    Page Should Contain     ${message}

Devo ver o profile do usuario "${username}", "${id_user}"
    ${url_atual}    Get Location
    Should Match Regexp    ${url_atual}    ${URL_USER}users/${id_user}
    Page Should Contain     ${username}
    