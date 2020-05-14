*** Settings ***
Documentation     Padrao Page Object da tela de Settings do usuario no positiveness
Library  SeleniumLibrary

*** Variables ***
${URL_SETTINGS}      https://positiveness.herokuapp.com/

${settings_input_name}    id:user_name
${settings_input_email}      id:user_email 
${settings_input_password}   id:user_password
${settings_input_password_confirmation}   id:user_password_confirmation
${settings_btn_save_changes}    name:commit

*** Keywords ***
Teste
    [Arguments]     ${name}     ${email}    ${password}     ${password_confirmation}
    Input Text      ${settings_input_name}       ${name}
    Input Text      ${settings_input_email}      ${email}
    Input Text      ${settings_input_password}       ${password}
    Input Text      ${settings_input_password_confirmation}      ${password_confirmation}

Clicar botao Save Changes
    Click Element   ${settings_btn_save_changes}