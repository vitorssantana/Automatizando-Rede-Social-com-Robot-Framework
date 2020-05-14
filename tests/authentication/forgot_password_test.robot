*** Settings ***
Documentation   O usuario esta na tela forgto password e pode digitar seu email para recuperar sua senha
Resource    ../../resources/authentication/forgot_password_steps.robot

Test Setup  Entrando na pagina Forgot password
Test Teardown  Fechando browser

*** Test Cases ***

Submeter a pagina sem preencher email
    Tento submeter com o email ""
    Devo ver a mensagem "Campo email é obrigatório"

Submeter a pagina preenchendo email invalido
    [Template]  Preenchimento de email invalido
    vitorsantana@robotcom 
    vitorsantana.robot.com 
    545454545454545465667
    @robot.com

Submeter a pagina preenchendo email nao cadastrado
    Tento submeter com o email "email@nao.com"
    Devo ver a mensagem "Email nao cadastrado"

Submeter a pagina preenchendo email cadastrado
    Tento submeter com o email "vitor@test.com"
    Devo ver a mensagem "Um link foi enviado para seu email para a recuperacao da senha"

*** Keywords ***
Preenchimento de email invalido
    [Arguments]  ${EMAIL}
    Tento submeter com o email "${EMAIL}"
    Devo ver mensagem "Email não é válido"    