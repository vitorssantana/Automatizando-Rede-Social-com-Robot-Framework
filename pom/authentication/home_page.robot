*** Settings ***
Documentation     Padrao Page Object da pagina do home
Library  SeleniumLibrary

*** Variables ***
${URL_HOME}      https://positiveness.herokuapp.com/

${btn_sign_up_now}=     class:btn-primary

*** Keyword ***
Clicar Botao Sign up now!
    Click Element   ${btn_sign_up_now}