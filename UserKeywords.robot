*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    JSONLibrary
Library    ../ExternalKeywords/UserKeywords.py
*** Variables ***
${App_Base_Url}    http://thetestingworldapi.com/

*** Keywords ***
Fetch and Validate Get Status Code
    [Arguments]    ${student_id}    ${expectedStatusCode}
    create session    E2E    ${App_Base_Url}
    ${get_response}=    GET On Session  E2E    api/studentsDetails/${student_id}
    ${status_code}=    convert to string    ${get_response.status_code}
    should be equal    ${expectedStatusCode}   ${status_code}
#    ${json_response}=    to json    ${get_response.content}
#    log to console    ${json_response}
#    ${first_name_list}=    get value from json    ${json_response}    data.first_name
#    log to console    ${first_name_list}
#    ${first_name}=    get from list    ${first_name_list}    0
#    should be equal    ${first_name}    ${update_first_name}

Fetch and Return Get Response
    [Arguments]    ${student_id}
    create session    E2E    ${App_Base_Url}
    ${get_response}=    GET On Session  E2E    api/studentsDetails/${student_id}
    [Return]    ${get_response}

Fetch Request Content
    ${json_body}=    read request content
    [Return]    ${json_body}
