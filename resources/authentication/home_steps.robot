*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource    ../global_variables.robot
Resource    ../../pom/authentication/home_page.robot

*** Keywords ***
Entrando no link da home
    Open Browser    ${URL_HOME}  ${BROWSER}

Fechando browser
    Close Browser

Clico no botao de Sign Up
    Clicar Botao Sign up now!

Devo ver a pagina de Sign Up do sistema
    ${url_atual}    Get Location
    Should Match Regexp    ${url_atual}    https://positiveness.herokuapp.com/signup
    Page Should Contain Element     id:user_name
    Page Should Contain Element     id:user_email  
    Page Should Contain Element     id:user_password
    Page Should Contain Element     id:user_password_confirmation
    Page Should Contain Element     xpath://input[@value="Create my account"]


