*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/CommonPageUI.py
Variables   ../PageUIs/ChangePasswordPageUI.py

*** Variables ***

*** Keywords ***
Input password infomation
    [Arguments]     ${OLD_PASSWORD}     ${NEW_PASSWORD}     ${CONFIRM_PASSWORD}
    ${LIST_DATA}=   Create Dictionary
    ...     ${OLD_PASSWORD_TEXTBOX }=${OLD_PASSWORD}
    ...     ${NEW_PASSWORD_TEXTBOX }=${NEW_PASSWORD}
    ...     ${CONFIRM_PASSWORD_TEXTBOX}=${CONFIRM_PASSWORD}

    FOR     ${TEXTBOX_FIELD}    ${VALUE}    IN  &{LIST_DATA}
        Input text  ${TEXTBOX_FIELD}  ${VALUE}
    END

Click change password button
    Click Element   ${SAVE_CHANGE_PASSWORD_BUTTON}

Click close button
    Wait Until Element Is Visible    ${CLOSE_BUTTON}    timeout=2s
    Click Element   ${CLOSE_BUTTON}