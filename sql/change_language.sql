
-- De oorspronkelijke tabel hernoemen
ALTER TABLE stockgroups
RENAME TO stockgroups_en

--nieuwe tabel aanmaken (voor nl)
CREATE TABLE IF NOT EXISTS stockgroups_nl
(
    StockGroupID	INT(11)		NOT NULL,
    StockGroupName	VARCHAR(50) NOT NULL,
    LastEditedBy 	INT(11)		NOT NULL,
    ValidFrom 		DATETIME  	NOT NULL,
    ValidTo 		DATETIME 	NOT NULL,
    ImagePath		VARCHAR(255) 		NULL,
    PRIMARY KEY (StockGroupID)
    );

--de nieuwe tabel vullen met waarden
INSERT INTO stockgroups_nl
VALUES (1, 'Hebbedingetjes', 1, '2013-01-01 00:00:00', '9999-12-31 23:59:59', 'Chocolate.jpg');

INSERT INTO stockgroups_nl
VALUES (2, 'Kleding', 1, '2013-01-01 00:00:00', '9999-12-31 23:59:59', 'Clothing.jpg');

INSERT INTO stockgroups_nl
VALUES (3, 'Mokken', 1, '2013-01-01 00:00:00', '9999-12-31 23:59:59', 'NULL');

INSERT INTO stockgroups_nl
VALUES (4, 'T-shirt', 1, '2013-01-01 00:00:00', '9999-12-31 23:59:59', 'T-shirts.jpg');

INSERT INTO stockgroups_nl
VALUES (5, 'Vliegtuig Hebbedingetjes', 1, '2013-01-01 00:00:00', '9999-12-31 23:59:59', 'AirlineNovelties.jpg');

INSERT INTO stockgroups_nl
VALUES (6, 'Computer Hebbedingetjes,', 1, '2013-01-01 00:00:00', '9999-12-31 23:59:59', 'ComputerNovelties.jpg');

INSERT INTO stockgroups_nl
VALUES (7, 'USB Hebbedingetjes', 1, '2013-01-01 00:00:00', '9999-12-31 23:59:59', 'USBNovelties.jpg');

INSERT INTO stockgroups_nl
VALUES (8, 'Sloffen', 9, '2013-01-01 00:00:00', '9999-12-31 23:59:59', 'NULL');

INSERT INTO stockgroups_nl
VALUES (9, 'Speelgoed', 1, '2013-01-01 00:00:00', '9999-12-31 23:59:59', 'Toys.jpg');

INSERT INTO stockgroups_nl
VALUES (10, 'Verpakkingsmateriaal', 1, '2013-01-01 00:00:00', '9999-12-31 23:59:59', 'NULL');

--spellingsfouten en wat vertaalwijzigingen
UPDATE stockgroups_nl
SET StockGroupName = 'Computer Hebbedingetjes'
WHERE StockGroupName = 'Computer Hebbedingetjes,';

UPDATE stockgroups_nl
SET StockGroupName = 'Souveniers'
WHERE StockGroupName = 'Hebbedingetjes';

UPDATE stockgroups_nl
SET StockGroupName = 'Vliegtuig Accessoires'
WHERE StockGroupName = 'Vliegtuig Hebbedingetjes';

UPDATE stockgroups_nl
SET StockGroupName = 'Computer Accessoires'
WHERE StockGroupName = 'Computer Hebbedingetjes';

UPDATE stockgroups_nl
SET StockGroupName = 'USB Accessoires'
WHERE StockGroupName = 'USB Hebbedingetjes';

-- verbindingen leggen met de tabel voor nl
ALTER TABLE stockgroups_nl
    ADD FOREIGN KEY (LastEditedBy) REFERENCES people(PersonID);

ALTER TABLE stockitemstockgroups
    ADD FOREIGN KEY (StockGroupID) REFERENCES stockgroups_nl(StockGroupID);

ALTER TABLE specialdeals
    ADD FOREIGN KEY (StockGroupID) REFERENCES stockgroups_nl(StockGroupID);

--nieuwe tabel met vertalingen aanmaken
CREATE TABLE IF NOT EXISTS Translation_table
(
    Name			VARCHAR(50) 		NOT NULL,
    en			VARCHAR(50) 		NOT NULL,
    nl			VARCHAR(50) 		NOT NULL,
    PRIMARY KEY (Name)
    );

INSERT INTO translation_table (`name`, `en`, `nl`)VALUES
('Kop_overzicht', 'All categories', 'Alle categorieën'),
('Kop_zoeken', 'Search', 'Zoeken'),
('Voorraad_veel_aanwezig', 'Much stock available', 'Veel voorraad aanwezig'),
('Voorraad_afwezig', 'Product unavailable', 'Product niet op voorraad'),
('Voorraad_een_deel1', 'Hurry! Only ', 'Schiet op! Nog'),
('Voorraad_een_deel1', ' item left', ' item op voorraad'),
('Voorraad_minder_dan_vijftig_deel1', 'Hurry! Only ', 'Schiet op! Nog' ),
('Voorraad_minder_dan_vijftig_deel2',' items left', ' items op voorraad'),
('Voorraad_overige_opties', 'items in stock', 'producten op voorraad'),
('Prijs_regel', 'Including VAT', 'Inclusief BTW'),
('Artikelnummer', 'Articlenumber', 'Artikelnummer'),
('Productinformatie-titel_omschrijving', 'Article description', 'Artikelomschrijving'),
('Productinformatie_titel_specificaties', 'Article specifications', 'Artikel specificaties'),
('Productinformatie_specificaties_naam', 'Name', 'Naam'),
('Productinformatie_specificaties_data', 'Data', 'Data'),
('Geen_resultaten1', 'The searched product could not be found', 'Het gezochte product is niet gevonden'),
('Geen_resultaten2', 'Yarr, no results have been found','Oeps, er zijn geen resultaten gevonden'),
('Toevoegen_winkelmandje_button', 'Add to shopping cart', 'Toevoegen aan winkelmandje'),
('Toevoegen_winkelmandje1', 'Product added to ', 'Product is toegevoegd aan '),
('Toevoegen_winkelmandje2', ' shopping cart', 'winkelmandje'),
('Winkelmandje_paginatitel', 'Shopping cart', 'Winkelmandje'),
('Winkelmandje_titel_overzicht', 'Shopping cart contents', 'Overzicht winkelmandje'),
('Winkelmandje_overzicht_afbeelding', 'Image', 'Afbeelding'),
('Winkelmandje_en_checkout_overzicht_naam', 'Name', 'Naam'),
('Winkelmandje_en_checkout_overzicht_aantal', 'Quantity', 'Aantal'),
('Winkelmandje_overzicht_prijs', 'Price(incl. VAT)', 'Prijs(incl. BTW)'),
('Winkelmandje_overzicht_ID', 'ID', 'ID'),
('Winkelmandje_laatste_kolom', 'Delete', 'Verwijderen'),
('Winkelmandje_en_checkout_totaalprijs', 'Total price (incl. VAT)', 'Totaalprijs (incl. BTW)'),
('Winkelmandje_overzicht_button', 'Place order', 'Plaats bestelling'),
('Winkelmanjde_leeg_winkelmandje', 'You can''t place an order with an empty cart', 'Je kan geen bestelling plaatsen met een lege winkelmand'),
('Checkout_paginatitel', 'Pay order', 'Afrekenen bestelling' ),
('Checkout_titel_overzicht', 'Order summary', 'Samenvatting bestelling'),
('Checkout_overzicht_kop_prijs_extra', 'Price per product(incl. VAT):', 'Prijs per product(incl.BTW)'),
('Persoonsgegevens_titel', 'Contact information: ', 'Contact informatie: '),
('Persoonsgegevens_voornaam', 'First name', 'Voornaam'),
('Persoonsgegevens_achternaam', 'Last name', 'Achternaam'),
('Persoonsgegevens_bezorg_postcode','Delivery postal code', 'Bezorg postcode' ),
('Persoonsgegevens_postcode', 'Postal code', 'Postcode'),
('Persoonsgegevens_huisnummer', 'House number', 'Huisnummer'),
('Persoonsgegevens_stad', 'City', 'Stad'),
('Persoonsgegevens_e-mail', 'e.g Example@windesheim.nl', 'bijv. Voorbeeld@windesheim.nl'),
('Persoonsgegevens_telefoonnummer', 'Phone number', 'Telefoonnummer'),
('Persoonsgegevens_bezorgadres', 'Delivery Addres', 'Bezorgadres'),
('Persoonsgegevens_bezorgadres_toevoeging', 'Apartment, suite, etc.', 'Appartement, suite, enz.'),
('Persoonsgegevens_postadres', 'Postal adres', 'Postadres'),
('Persoonsgegevens_postadres_toevoeging', 'Postal address 2', 'Postadres 2'),
('Persoonsgegevens_knop_naar_winkelmand', 'Back to shopping cart', 'Terug naar winkelmand'),
('Persoonsgegevens_knop_naar_iDeal', 'Confirm and continue', 'Bevestig en doorgaan'),
('Betaalpagina_paginatitel', 'iDeal confirmation screen', 'Ideal bevestigingsscherm'),
('Betaalpagina-totaalprijs', 'Amount to pay', 'Te betalen'),
('Betaalpagina-keuze_bank', 'Choose your bank', 'Kies je bank'),
('Betaalpagina_bank_ABN-Amro', 'ABN Amro', 'ABN Amro'),
('Betaalpagina_bank_Bunq', 'Bunq', 'Bunq'),
('Betaalpagina_bank_ING', 'ING', 'ING'),
('Betaalpagina_bank_MoneyYou', 'MoneyYou', 'MoneyYou'),
('Betaalpagina_bank_Rabobank', 'Rabobank', 'Rabobank'),
('Betaalpagina_bank_SNS', 'SNS', 'SNS'),
('Betaalpagina_bank_ASN', 'ASN', 'ASN'),
('Betaalpagina_bank_Knab', 'Knab', 'Knab'),
('Betaalpagina_knop_terug', 'Back', 'Terug'),
('Betaalpagina_knop_betaal', 'Pay', 'Betaal'),
('Betaalbevestigingsscherm_paginatitel', 'Payment is completed screen' ,'Betaling is voltooid scherm'),
('Betaalbevestigingsscherm_tekst', 'The payment has been accepted', 'De betaling is geacepteerd'),
('Betaalbevestigingsscherm_knop_terug_naar_site', 'Return to NerdyGadgets', 'Terug naar NerdyGadgets');



