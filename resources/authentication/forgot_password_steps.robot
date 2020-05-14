*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource    ../global_variables.robot
Resource    ../../pom/authentication/forgot_password_page.robot

*** Keywords ***
Entrando na pagina Forgot password
    Open Browser    ${URL}  ${BROWSER}

Fechando browser
    Close Browser

Tento submeter com o email "${email}"
    Submeter Email      ${email}

Devo ver a mensagem "${mensagem}"
    Page Should Contain     ${mensagem}

