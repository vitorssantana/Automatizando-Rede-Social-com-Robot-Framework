*** Settings ***
Documentation   O usuario esta na tela de home e pode criar um novo usuario
Resource    ../../resources/authentication/home_steps.robot

Test Setup  Entrando no link da home
Test Teardown  Fechando browser

*** Test Cases ***
Acessar tela de Sign Up
    Clico no botao de Sign Up
    Devo ver a pagina de Sign Up do sistema