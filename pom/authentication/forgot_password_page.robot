*** Settings ***
Documentation     Padrao Page Object da pagina de recover password
Library  SeleniumLibrary

*** Variables ***
${URL}      https://positiveness.herokuapp.com/password_resets/new

${input_email}      id:password_reset_email
${btn_submit}    class:btn-primary

*** Keywords ***
Submeter Email
    [Arguments]     ${email}
    Input Text      ${input_email}      ${email}
    Click Element   ${btn_submit}