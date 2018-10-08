# language: da

Egenskab: Eksempler
  (Vær opmærksom på: du kan godt slette den her fil, efter du sikrer at cucumber kører)

  Scenarie: Jeg besøger DRDKs hjemmeside
    Givet jeg er på DRDKs hjemmeside
    Så skal jeg se "DR" i titlen

  Scenarie: Jeg tilføjer favoritkanaler i Radio oversigt
    Givet jeg er på radio-oversigten
    Når jeg tilføjer "P4 København" som en Favoritkanal
    Så skal jeg se kun de følgende kanaler:
       | P4 København |
    Når jeg tilføjer "DR P1" som en Favoritkanal
    Så skal jeg se kun de følgende kanaler:
       | P4 København |
       | DR P1        |
