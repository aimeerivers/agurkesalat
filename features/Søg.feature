# language: da

Egenskab: Søg

  Scenarie: Søg og find resutlater
    Givet jeg er på DRDKs søgside
    Når jeg søger efter "Brexit"
    Så skal jeg finde nogle resultater

  @wip
  Scenarie: Søg og find ingen resutlater
    Givet jeg er på DRDKs søgside
    Når jeg søger efter "Brexit Means Bananas"
    Så skal jeg finde ingen resultater
