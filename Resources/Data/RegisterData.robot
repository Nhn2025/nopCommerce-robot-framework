*** Settings ***
Library    Collections

*** Variables ***
${FIRST_NAME}   Nhu
${LAST_NAME}   Duong
${INVALID_EMAIL}   nhu@gmail
${EXISTING_EMAIL}   nhu@gmail.com
${PASSWORD}   12345678@
${CONFIRM_PASSWORD}   12345678@
${NOT_MATCH_CONFIRM_PASSWORD}    123456789
${INVALID_PASSWORD}     123
${INVALID_CONFIRM_PASSWORD}     123

${FIRST_NAME_REQUIRED_TEXT}     First name is required.
${LAST_NAME_REQUIRED_TEXT}  Last name is required.
${EMAIL_REQUIRED_TEXT}  Email is required.
${PASSWORD_REQUIRED_TEXT}   Password is required.
${EMAIL_INVALID_TEXT}   Wrong email
${EMAIL_EXISTING_TEXT}   The specified email already exists
${SUCCESS_REGISTER_TEXT}     Your registration completed
${INVALID_PASSWORD_TEXT}    <p>must meet the following rules: </p><ul><li>must have at least 6 characters and not greater than 64 characters</li></ul>
${NOT_MATCH_CONFIRM_PASSWORD_TEXT}  The password and confirmation password do not match.