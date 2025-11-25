*** Settings ***
Library      AppiumLibrary
Test Setup    lancer l'application
Test Teardown    Remove Application    ${id_APP}

*** Variables ***
${id_APP}   com.example.jeuxdede
${bouton_de_6}   ${id_APP}:id/button6
${bouton_de_12}   ${id_APP}:id/button12
${bouton_lancer}   ${id_APP}:id/buttonRoll
${texte_resultat}   ${id_APP}:id/textResult
*** Test Cases ***
test jeu de dé 6
# vérifier que la valeur est inférieure ou égale à 6
    sélectionner le dé de 6
    lancer le dé
    verifier valeur
 #
# Test lancement dé avec appel téléphonique
test jeu de dé 6 avec appel
    sélectionner le dé de 6
    lancer le dé
    ${valeur}   recupérer valeur
    Log To Console   Valeur du dé avant l'appel: ${valeur}
    passer un appel téléphonique et raccrocher
    ${valeur_apres}   recupérer valeur
    Should Be Equal   ${valeur}   ${valeur_apres}
    verifier valeur

*** Keywords ***
sélectionner le dé de 6
    Wait Until Element Is Visible      ${bouton_de_6}   10s
    Click Element  ${bouton_de_6} 
sélectionner le dé de 12
    Wait Until Element Is Visible      ${bouton_de_12}    10s
    Click Element  ${bouton_de_12} 
lancer le dé
    Wait Until Element Is Visible      ${bouton_lancer}  10s
    Click Element  ${bouton_lancer}

verifier valeur
    Wait Until Element Is Visible      ${texte_resultat}  10s
    ${x}   get text  ${texte_resultat}
    Should Be True  ${x} < 7
recupérer valeur

    Wait Until Element Is Visible      ${texte_resultat}  10s
    ${x}   get text  ${texte_resultat}
    RETURN   ${x}

passer un appel téléphonique et raccrocher
    # Simuler un appel entrant pendant le jeu de dé
    &{scriptArgument}    Create Dictionary    phoneNumber=123    action=call
    Execute Script    mobile:gsmCall   &{scriptArgument}
    # répondre à l'appel
    &{scriptArgument}    Create Dictionary    phoneNumber=123    action=accept
    Execute Script    mobile:gsmCall   &{scriptArgument}
    sleep  2
    # raccrocher l'appel
    &{scriptArgument}    Create Dictionary    phoneNumber=123    action=cancel
    Execute Script    mobile:gsmCall   &{scriptArgument}




lancer l'application
    Open Application    http://127.0.0.1:4723    platformName=Android    appium:platformVersion=16    appium:app=/Users/dominiquemereaux/AndroidStudioProjects/jeuxdede/app/build/outputs/apk/debug/app-debug.apk    appium:automationName=uiautomator2    appium:ensureWebviewsHavePages=${True}    appium:nativeWebScreenshot=${True}    appium:newCommandTimeout=${3600}    appium:connectHardwareKeyboard=${True}