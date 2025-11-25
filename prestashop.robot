*** Settings ***
Resource  motClefPresta.resource
Test Setup    Ouvrir Prestashop
Test Teardown   Fermer Prestashop


*** Test Cases ***
test navigateur
  Ouvrir Prestashop
  Fermer Prestashop
Recherche MUG
   Faire une recherche  MUG
   Contrôler le résultat de recherche égal à     Il y a 5 produits.
Recherche T-Shirt
  Faire une recherche   T-Shirt 
  Contrôler le résultat de recherche égal à     Il y a 1 produit.
