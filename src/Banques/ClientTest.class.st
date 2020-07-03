Class {
	#name : #ClientTest,
	#superclass : #TestCase,
	#instVars : [
		'client',
		'compt',
		'Assoo'
	],
	#category : #Banques
}

{ #category : #running }
ClientTest >> setUp [
	client := Client new compte: (Compte new montant: 2000).
	client id: 3.
	client compte numero: 3.
	client nom: 'Mbengono Elise'.
	Mbiaba := Client new compte: (Compte new montant: 3000).
	Mbiaba id: 2.
	Mbiaba compte numero: 4.
	Mbiaba nom: 'Mbiaba Mbato Ulrich'
]

{ #category : #tests }
ClientTest >> testConsulterCompte [
"TOn sait que le solde du client est initialisé à 2000 : voyons s'il renvoie 2000"
	
	self assert: (client consulterCompte) equals: 2000
]

{ #category : #tests }
ClientTest >> testDebloquer [
"Test de deblockage de compte. voyons si l'etat du compte est à true"
	self assert: client compte debloquer etat equals: true
]

{ #category : #tests }
ClientTest >> testDepot [
	client depot: 200.
	self assert: client compte montant equals: 2200
]

{ #category : #tests }
ClientTest >> testFermer [
"Test de fermeture de compte. voyons si l'etat du compte est à false"
	self assert: client compte fermer etat equals: false
]

{ #category : #tests }
ClientTest >> testRetirer [
"Test de retrait dans solde. ici, client est initialisé dans setUp"
	client retirer: 200.
	self assert: client compte montant equals: 1800
]

{ #category : #tests }
ClientTest >> testTransfererA [
	Mbiaba transferer: 1000 a: client.
	self
		assert: Mbiaba compte montant
		equals: client compte montant - 1000
]
