*** Settings ***
Documentation     Padrao Page Object da pagina de login do sistema
Library  SeleniumLibrary

*** Variables ***
${URL_LOGIN}      https://positiveness.herokuapp.com/login

${input_email}      xpath://*[@id="session_email"]
${link_forgot_password}     xpath://a[@href="/password_resets/new"]
${input_password}   id:session_password
${check_remember_me}    id:session_remember_me
${btn_login}    xpath://input[@name="commit"]
${link_sign_up}     xpath://a[@href="/signup"]

*** Keywords ***
Preencher Dados Login
    [Arguments]     ${email}      ${password}
    Input Text      ${input_email}      ${email}
    Input Text      ${input_password}   ${password}

Clicar Botao Login
    Click Element   ${btn_login}

Clicar Link Forgot Password
    Click Element   ${link_forgot_password}

Clicar Check Remember Me
    Click Element   ${check_remember_me}

Clicar Link Sign Up
    Click Element   ${link_sign_up}