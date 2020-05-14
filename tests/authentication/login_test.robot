*** Settings ***
Documentation   O usuario esta na tela de home e pode criar um novo usuario
Resource    ../../resources/authentication/login_steps.robot

Test Setup  Entrando no link da pagina de login
Test Teardown  Fechando browser

*** Test Cases ***
Clicar link forgot password
    Clico no link para recuperar senha
    Devo ver a tela de forgot password    

Clicar link Sign up now!
    Clico no link para cadastrar novo user
    Devo ver a tela de Sign Up

Tentar logar com campos vazios
    Tento logar com user "", ""
    Devo ver a mensagem "Email não pode ficar em branco"
    Devo ver a mensagem "Password não pode ficar em branco"

Tentar logar com email invalido
    [Template]  Preenchimento de email invalido
    vitorsantana@robotcom 
    vitorsantana.robot.com 
    545454545454545465667
    @robot.com

Tentar logar com senha invalida
    Tento logar com user "test@test.com", "1234"
    Devo ver a mensagem "Senha não é valida"

Realizar login com sucesso
    Tento logar com user "test@test.com", "test123"
    Devo ver o profile do usuario "Rails Test", "106"

*** Keywords ***
Preenchimento de email invalido
    [Arguments]  ${EMAIL}
    Tento logar com user "${EMAIL}", "1234"
    Devo ver mensagem "Email não é válido"