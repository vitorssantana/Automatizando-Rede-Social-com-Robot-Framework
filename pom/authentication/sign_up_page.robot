*** Settings ***
Documentation     Padrao Page Object da pagina de sign up do sistema
Library  SeleniumLibrary

*** Variables ***
${URL_SIGN_UP}      https://positiveness.herokuapp.com/signup

${input_name}=      id:user_name
${input_email}=     id:user_email  
${input_password}=  id:user_password
${input_password_confirmation}=     id:user_password_confirmation
${btn_create_my_account}=   xpath://input[@value="Create my account"]

*** Keyword ***

Preencher Dados Usuario
    [Arguments]    ${name}      ${email}     ${password}     ${password_confirmation}
    Input Text  ${input_name}   ${name}
    Input Text  ${input_email}      ${email}
    Input Text  ${input_password}   ${password} 
    Input Text  ${input_password_confirmation}  ${password_confirmation}

Clicar Botao Create my Account
    Click Element   ${btn_create_my_account}