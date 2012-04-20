Website des Musikverein Biberach
================================

Features
--------

- einfaches CMS zur Verwaltung der statischen Inhalte der Website
- Veranstaltungskalender (incl. ICal)
- Probenpläne für die Orchester
- Bildergalerien

User Guide
----------

Änderungen an den Inhalten der Seite nur von angemeldeten Benutzern vorgenommen werden.
Neue Einträge (Bildergallerien, Termine, Probenpläne) können über die Übersichtsseiten
angelegt werden. Bestehende Einträge können über die jeweiligen Detailseiten gepflegt
werden.

Seiten pflegen

Sobald ein Benutzer angemeldet ist, erscheint auf den pflegbaren Seiten ein Link mit
der Beschriftung "Bearbeiten". Der Link öffnet die Seite im Bearbeitungsmodus. Über einen
Word-ähnlichen Editor (WYSIWYG) können Texte, Formatierungen und Bilder auf der Seite verändert
werden. Nach dem Speichern der Änderungen sind diese sofort sichtbar.

Events verwalten

Über den Link "Termine" im Menü der Seite erreicht man den Terminkalender. Wenn ein Benutzer
angemeldet ist, erscheit ein Link "neuer Event" bzw. "neues Konzert" über dem eigentlichen Terminkalender.
Über diesen Link kann ein neuer Termin/Konzert angelegt werden.

Bestehende Termine/Konzerte kann ein angemeldeter Benutzer über die Detail-Seite des Termins/Konzerts
bearbeiten.

Bildergallerien verwalten

Probenpläne anpassen

Die Probenpläne enthalten automatisch alle für das Orchester relevanten Termine/Konzerte. Zusätzlich kann
ein Text erfasst werden, der vor den Terminen im Probeplan angezeigt wird.



Developer Guide
---------------
Die Seite wird mit [Ruby on Rails](http://www.rubyonrails.org) 3.2.x gebaut.
Neben Rails kommen noch die folgenden Gems zum Einsatz:

- [Twitter Bootstrap](http://twitter.github.com/bootstrap/) bzw. [bootstrap-sass](https://github.com/thomas-mcdonald/bootstrap-sass) zum Layouting
- [Sass](http://sass-lang.com), [bourbon](https://github.com/thoughtbot/bourbon) CSS3-Templates
- [JQuery](http://jquery.com/) in Form von [Jquery-Rails](https://github.com/indirect/jquery-rails)
- [Paperclip](https://github.com/thoughtbot/paperclip) zum Management von Files.
- [ckeditor](https://github.com/galetahub/rails-ckeditor) als WYSIWYG-Editor der CMS-Komponente
- [devise](https://github.com/plataformatec/devise) zur Authentifizierung
- [EventCalendar](https://github.com/elevation/event_calendar) zur Darstellung der Termine
- [iCalendar](http://icalendar.rubyforge.org/) um Termine im iCal-Format anzubieten

