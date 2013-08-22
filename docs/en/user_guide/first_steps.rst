
Erste Schritte
==============

*jarvis sometimes you gotta run before you can walk*
The following document displays the elemental functions of **Klinai**.



Install - Composer
---------

Download `composer.phar`_ and insert the following dependencies to your "composer.json"-file.

.. code-block:: javascript

    {
        "require": {
            "klinai/klinai": "dev-master"
        }
    }

First installation

.. code-block:: shell
    
    # php composer.phar self-update
    # php composer.phar install

Update

.. code-block:: shell
    
    # php composer.phar self-update
    # php composer.phar update




Install - Manually
---------
Download the library from `github`_  and include it in your autoload-method.


Embedding
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


Create document
------------------
In order to create new documents the client requires an array or an equivalant StdClass objects.
These data-arrays my contain every data possibly stored in arrays.
If you want to store an object and the ID is already known, you are able to hand the ID over as an element.
If no ID is given, CouchDB generates a random ID (similar to the *auto_increment* known from SQL-based databases).
The client returns an object containing the ID and the revisionnumber (*_rev*).


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

    // ...
    $docA = $client->getDoc('client_test1', 'someDocumentId');
    $docB = $client->getDoc('client_test1', 'otherDocumentId');



Werte eines bestimmten Dokumentes auslesen
------------------
Angenommen es gibt ein document "x" mit name, email


.. code-block:: php

    // ...
    $docA = $client->getDoc('client_test1', 'someDocumentId');
    echo $docA->name . "\n";
    echo $docA->email . "\n";

Werte eines bestimmten Dokumentes ändern
------------------
info zu autorecording


.. code-block:: php

    // ...
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

    // ...
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
