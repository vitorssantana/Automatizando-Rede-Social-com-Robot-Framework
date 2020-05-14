*** Settings ***
Documentation   O usuario esta na tela de Settings e pode alterar todos os dados
Resource    ../../resources/system/settings_steps.robot
Test Setup  Abrindo browser e logando com usuario "test@test.com" "test123", "106"
Test Teardown  Fechando browser

*** Test Cases ***
Tentar salvar com os campos em branco
    Tento alterar user com dados " ", " ", " ", " "
    Devo ver mensagem "Name não pode ficar em branco"
    Devo ver mensagem "Email não pode ficar em branco"
    Devo ver mensagem "Password não pode ficar em branco"
    Devo ver mensagem "Password confirmation não pode ficar em branco"

Tentar salvar dados com email invalido
    [Template]  Preenchimento de email invalido
    vitorsantana@robotcom 
    vitorsantana.robot.com 
    545454545454545465667
    @robot.com

Tentar salvar com senhas invalidas
    [Template]  Preenchimento de senha invalida
    12345
    abcde
    @#$%ˆ
    1@Ev4    

Tentar salvar usando dados corretos
    Tento alterar user com dados "Rails Test", "test@test.com", "test123", "test123"
    Devo ver mensagem "User atualizado com sucesso"

*** Keywords ***
Preenchimento de email invalido
    [Arguments]  ${EMAIL}
    Tento alterar user com dados "Rails Test", "${EMAIL}", "test123", "test123"
    Devo ver mensagem "Email não é válido"

Preenchimento de senha invalida
    [Arguments]  ${SENHA}
    Tento alterar user com dados "Rails Test", "test@test.com", "${SENHA}", "${SENHA}"
    Devo ver mensagem "Password é muito curto (mínimo: 6 caracteres)"    