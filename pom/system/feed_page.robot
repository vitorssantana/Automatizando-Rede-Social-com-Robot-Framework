*** Settings ***
Documentation     Padrao Page Object do feed do usuario no positiveness
Library  SeleniumLibrary

*** Variables ***
${URL_FEED}      https://positiveness.herokuapp.com/
${link_view_my_profile}     xpath://a[text()="view my profile "]
${link_following}   xpath://div[@class="stats"]/a[1]
${link_followers}   xpath://div[@class="stats"]/a[2]
${textarea_compose_new_post}   id:post_content
${button_choose_file}  id:post_picture 
${btn_post}     name:commit
${list_posts}       xpath://li[@class="post-div"]


*** Keywords ***
Clicar view my profile
    Click Element   ${link_view_my_profile} 

Digitar Novo Post
    [Arguments]     ${texto}
    Input Text     ${textarea_compose_new_post}  ${texto}

Postar post no feed
    Click Element   ${btn_post}

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
        Run Keyword If      "${text}"=="${message}"       Click Element     ${list_posts} [${index}]/div[1]/a
    END

Entrar profile user
    [Arguments]     ${user}
    ${list_post_user}=    Get WebElements     ${list_posts}
    ${length}=      Get Length      ${list_post_user}
    FOR    ${index}   IN RANGE     1    ${length}
        ${element}=     Catenate    SEPARATOR=    ${list_posts} [${index}]/span[1]/a
        ${text}=    Get Text     ${element}
        Log to console      ${text}
        Exit For Loop IF      "${text}"=="${user}"         
    END
    Click Element     ${list_posts} [${index}]/span[1]/a