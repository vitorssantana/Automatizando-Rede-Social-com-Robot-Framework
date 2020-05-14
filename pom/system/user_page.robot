*** Settings ***
Documentation     Padrao Page Object do profile do usuario no positiveness
Library  SeleniumLibrary

*** Variables ***
${URL_USER}      https://positiveness.herokuapp.com/
${link_following}   xpath://div[@class="stats"]/a[1]
${link_followers}   xpath://div[@class="stats"]/a[2]
${list_posts}       xpath://li[@class="post-div"]
${btn_follow}       xpath://input[@value="Follow"]
${btn_unfollow}     xpath://input[@value="Unfollow"]


*** Keyword ***

Clicar link following
    Click Element   ${link_following} 

Clicar link followers
    Click Element   ${link_followers}

Deletar post
    [Arguments]     ${message}
    ${list_post_user}=    Get WebElements     ${list_posts}
    ${length}=      Get Length      ${list_post_user}
    FOR    ${index}   IN RANGE     1    ${length}
        ${element}=     Catenate    SEPARATOR=    ${list_posts} [${index}]/span[2]
        ${text}=    Get Text     ${element}
        Log to console      ${text}
        Log to console      ${message}
        Run Keyword If      "${text}"=="${message}"       Click Element     ${list_posts} [${index}]/div[1]/a
    END

Clicar Botao Follow
    Click Element   ${btn_follow}
   
Clicar Botao Unfollow
    Click Element   ${btn_unfollow}