import 'package:flutter/material.dart';

TextButton politique = TextButton(
  onPressed: () {
    print('hi');
  },
  child: Text(
    'Politique de confidentialité',
  ),
);
TextButton cond = TextButton(
  onPressed: () {
    print('hi');
  },
  child: Text(
    'Conditionds d\'utilisation',
  ),
);
String confid =
    'Veuillez lire notre Politique de confidentialité. Appuyez sur "Accepter et continuer" pour accepter les Conditionds d\'utilisation.';
String telverif =
    'TkalamApp va envoyer un message SMS pour vérifier votre numéro de téléphone.';
String detect = 'En attente de détéction automatique d\'un SMS envoyé au ';
