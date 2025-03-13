*** Settings ***
Library     SeleniumLibrary
Variables   ../PageUIs/CommonPageUI.py
Variables   ../PageUIs/AddressesPageUI.py

*** Variables ***

*** Keywords ***
Click add new button
    Click Button   ${ADD_NEW_BUTTON_LOCATOR}

Input address information
    [Arguments]     ${FIRST_NAME_ADDRESS}   ${LAST_NAME_ADDRESS}    ${VALID_EMAIL}  ${COMPANY_ADDRESS}
    ...       ${COUNTRY_ADDRESS}  ${PROVINCE_ADDRESS}    ${CITY_ADDRESS}   ${ADDRESS_1}
    ...     ${ADDRESS_2}     ${ZIP_ADDRESS}     ${PHONE_ADDRESS}     ${FAX_NAME_ADDRESS}

    Select From List By Label    ${COUNTRY_DROPDOWN_LOCATOR}    ${COUNTRY_ADDRESS}
    Select From List By Label    ${PROVINCE_DROPDOWN_LOCATOR}    ${PROVINCE_ADDRESS}

    ${LIST_DATA}=   Create Dictionary
    ...     ${FIRST_NAME_ADDRESS_LOCATOR}=${FIRST_NAME_ADDRESS}
    ...     ${LAST_NAME_ADDRESS_LOCATOR}=${LAST_NAME_ADDRESS}
    ...     ${EMAIL_NAME_ADDRESS_LOCATOR}=${VALID_EMAIL}
    ...     ${COMPANY_NAME_ADDRESS_LOCATOR}=${COMPANY_ADDRESS}
    ...     ${CITY_TEXTBOX_LOCATOR}=${CITY_ADDRESS}
    ...     ${ADDRESS_1_TEXTBOX_LOCATOR}=${ADDRESS_1}
    ...     ${ADDRESS_2_TEXTBOX_LOCATOR}=${ADDRESS_2}
    ...     ${ZIP_TEXTBOX_LOCATOR}=${ZIP_ADDRESS}
    ...     ${PHONE_NUMBER_TEXTBOX_LOCATOR}=${PHONE_ADDRESS}
    ...     ${FAX_NUMBER_TEXTBOX_LOCATOR}=${FAX_NAME_ADDRESS}

    FOR     ${TEXTBOX_FIELD}    ${VALUE}    IN  &{LIST_DATA}
        Input text  ${TEXTBOX_FIELD}  ${VALUE}
    END


Verify updated address information is successfully saved
    [Arguments]     ${FIRST_NAME_ADDRESS}   ${LAST_NAME_ADDRESS}    ${VALID_EMAIL}
    ...     ${COMPANY_ADDRESS}  ${COUNTRY_ADDRESS}  ${PROVINCE_ADDRESS}    ${CITY_ADDRESS}
    ...     ${ADDRESS_1}     ${ADDRESS_2}     ${ZIP_ADDRESS}     ${PHONE_ADDRESS}     ${FAX_NAME_ADDRESS}

    ${ADDRESS_FIELDS}=   Create List     ${FIRST_NAME_ADDRESS}   ${LAST_NAME_ADDRESS}    ${VALID_EMAIL}
    ...     ${COMPANY_ADDRESS}  ${COUNTRY_ADDRESS}  ${PROVINCE_ADDRESS}    ${CITY_ADDRESS}
    ...     ${ADDRESS_1}     ${ADDRESS_2}     ${ZIP_ADDRESS}     ${PHONE_ADDRESS}     ${FAX_NAME_ADDRESS}

    FOR     ${FIELD}    IN  @{ADDRESS_FIELDS}
        Page Should Contain     ${FIELD}
    END

Click save button
    Click element   ${SAVE_BUTTON_ADDRESS}