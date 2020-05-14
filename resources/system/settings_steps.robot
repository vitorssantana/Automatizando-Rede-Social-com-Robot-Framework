*** Settings ***
Library  SeleniumLibrary
Library    Collections
Resource    ../global_variables.robot
Resource    ../../pom/system/settings_page.robot
Resource    ../../pom/authentication/login_page.robot

*** Keywords ***
Abrindo browser e logando com usuario "${email}" "${password}", "${id_user}"
    Open Browser    ${URL_LOGIN}  ${BROWSER}
    Preencher Dados Login  ${email}  ${password}
    Clicar Botao Login
    Go To   ${URL_SETTINGS}users/${id_user}/edit

Fechando browser
    Close Browser

Tento alterar user com dados "${name}", "${email}", "${password}", "${password_confirmation}"
    settings_page.Teste    ${name}     ${email}    ${password}     ${password_confirmation} 
    Clicar botao Save Changes

Devo ver mensagem "${mensagem}"
    Page Should Contain     ${mensagem}