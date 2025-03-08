*** Settings ***
Library    Collections

*** Variables ***
${FIRST_NAME}   Nhu
${LAST_NAME}   Duong
${INVALID_EMAIL}   nhu@gmail
${PASSWORD}   12345678@
${CONFIRM_PASSWORD}   12345678@

${FIRST_NAME_REQUIRED_TEXT}     First name is required.
${LAST_NAME_REQUIRED_TEXT}  Last name is required.
${EMAIL_REQUIRED_TEXT}  Email is required.
${PASSWORD_REQUIRED_TEXT}   Password is required.
${EMAIL_INVALID_TEXT}   Wrong email
${SUCCESS_REGISTER_MESSAGE}     Your registration completed