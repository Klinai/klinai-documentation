.. _introduction.overview:

*********
Übersicht
*********

Klinai ist eine Adapter für `CouchDB` und ist in der Lage mehre CouchDB gleichzeitig zuverwalten.
Diese Programmbibliothek bassiert auf *PHP* 5.4+ und *Zend-Http* 2.2.3+.
Da CouchDB `stateless` arbeitet gibt es keine Begründung warum man einen Client wie für eine statefull
Protokoll konzipiert und somit auf eine Datenbank pro Instance Limitiert. Weiter hin ist es es durch mehrfach Nutzung
einfacher möglich Referencen über die Datenbank Grenzen hin weg aufzubauen.

.. _`CouchDB`: http://couchdb.apache.org
.. _`stateless`: http://en.wikipedia.org/wiki/Stateless_protocol
