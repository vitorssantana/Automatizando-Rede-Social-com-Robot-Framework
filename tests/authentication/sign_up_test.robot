*** Settings ***
Documentation   O usuario esta na tela de Sign Up e pode cadastar um novo user
Resource    ../../resources/authentication/sign_up_steps.robot

Test Setup  Entrando no link do Sign up
Test Teardown  Fechando browser

*** Test Cases ***
Tentar criar user com campos em branco
    Tento cadastrar o user "", "", "", ""
    Devo ver mensagem "Name não pode ficar em branco"
    Devo ver mensagem "Email não pode ficar em branco"
    Devo ver mensagem "Email não é válido"
    Devo ver mensagem "Password não pode ficar em branco"

Tentar criar user com email invalido
    [Template]  Preenchimento de email invalido
    vitorsantana@robotcom 
    vitorsantana.robot.com 
    545454545454545465667
    @robot.com

Tentar criar user com senha com menos de 6 caracteres
    Tento cadastrar o user "Vitor", "vitor@vitor.com", "12345", "12345"
    Devo ver mensagem "Password é muito curto (mínimo: 6 caracteres)"

Tentar criar user com o campo da senha diferente da confirmacao de senha
    Tento cadastrar o user "Vitor", "vitor@vitor.com", "123456", "654321"
    Devo ver mensagem "Password confirmation não está de acordo com a confirmação"

Tentar criar user usando email ja usado por outro user
    Tento cadastrar o user "Test", "test@test.com", "123456", "123456"
    Devo ver mensagem "Email já está em uso"

Criar user com sucesso
    Tento cadastrar o user "Test", "test@test.com", "123456", "123456"
    Devo ver a tela de home

*** Keywords ***
Preenchimento de email invalido
    [Arguments]  ${EMAIL}
    Tento cadastrar o user "Vitor", "${EMAIL}", "123456", "123456"
    Devo ver mensagem "Email não é válido"