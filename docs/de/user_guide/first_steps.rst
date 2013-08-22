
Erste Schritte
==============

*jarvis sometimes you gotta run before you can walk*
Im Folgenden werden die grundlegenden Funktionen von **Klinai** dargestellt.



Installieren - Composer
---------

Downloade `composer.phar`_ und fügen folgende Abhängigkeit in deine "composer.json" ein.

.. code-block:: javascript

    {
        "require": {
            "klinai/klinai": "dev-master"
        }
    }

erst installation
.. code-block:: bash
    
    > php composer.phar self-update
    > php composer.phar install

aktualisieren
.. code-block:: bash
    
    > php composer.phar self-update
    > php composer.phar update




Installieren - Manual
---------
Downloade die Bibliothek von `github`_ und binde diese in deine Autoload-Methode ein.


Einbinden
---------

.. code-block:: php
    use Klinai\Client\Client;
    use Klinai\Client\ClientConfig;
    
    $config = new ClientConfig( array(
        'databases'=>array(
            'client_test1'=>array(
                'dbname'=>'klinai_test_db1',
                'host'=>'http://127.0.0.1:5984',
            ),
            'client_test2'=>array(
                'dbname'=>'klinai_test_db2',
                'host'=>'http://127.0.0.1:5984',
            )
        ),
    ));
    
    $client = new Client ();
    $client->setConfig($config);


Dokument anlegen
------------------
Zum Anlegen von neuen Dokumenten werden dem Client nur Arrays oder StdClass Objekte übergeben.
Diese DatenArray's können alle Daten enthalten die mit Array's abgebildet werden können.
Weiß man auf welche ID man das Objekt speichern möchte, kann man diese als Element mit angeben.
Sollte man keine ID angeben generiert Couch eine eigene ID (ähnlich dem *auto_increment*
aus SQL-basierten Datenbanken). Das von dem Client zurückgegebene Objekt enthält dann die ID, sowie die RevisionsNummer(*_rev*).


.. code-block:: php
    $docDataA = array(
        'name'=>'foo',
        'email'=>'foo@example.org',
    );
    $docA = $client->storeDoc('client_test1', $docDataA);
    
    
    $docDataB = array(
        'id'=>'someDocumentId',
        'name'=>'foo',
        'email'=>'foo@example.org',
    );
    $docB = $client->storeDoc('client_test1', $docDataB);
    

Dokument anfordern
------------------
.. code-block:: php
    ...
    $docA = $client->getDoc('client_test1', 'someDocumentId');
    $docB = $client->getDoc('client_test1', 'otherDocumentId');



Werte eines bestimmten Dokumentes auslesen
------------------
Angenommen es gibt ein document "x" mit name, email
.. code-block:: php
    ...
    $docA = $client->getDoc('client_test1', 'someDocumentId');
    echo $docA->name . "\n";
    echo $docA->email . "\n";

Werte eines bestimmten Dokumentes ändern
------------------
info zu autorecording
.. code-block:: php
    ...
    $docA = $client->getDoc('client_test1', 'someDocumentId');
    $docA->name = "fooBar";
    $docA->email = "fooBar";
    
    $docA->set(array(
        'name' =>'fooBar',
        'email' =>'fooBar@exampel.org'
    ));
    
    
Dokument löschen
------------------
.. code-block:: php
    ...
    $docA = $client->getDoc('client_test1', 'someDocumentId');
    $client->deleteDocument('client_test1', $docA);
    
    $docB = $client->getDoc('client_test1', 'otherDocumentId');
    $docB->delete();
    

`prev`_
`next`_

.. _`next`: ../index.rst
.. _`prev`: ../index.rst
.. _`composer.phar`: https://getcomposer.org/composer.phar
.. _`github`: https://github.com/Klinai/klinai/
