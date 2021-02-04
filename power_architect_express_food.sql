<changeSet author="CHANGEME" id="CHANGEME">
<createTable tableName="client_adresse">
  <column name="id" type="INTEGER">
    <constraints nullable="false"/>
  </column>
  <column name="adresse" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="ville" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="cp" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="pays" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="info_livraison" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
</createTable>
<addPrimaryKey tableName="client_adresse" constraintName="client_adresse_pk" columnNames="id"/>

<createTable tableName="compte">
  <column name="id" type="INTEGER">
    <constraints nullable="false"/>
  </column>
  <column name="type" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
</createTable>
<addPrimaryKey tableName="compte" constraintName="compte_pk" columnNames="id"/>

<createTable tableName="cuisinier">
  <column name="id" type="INTEGER">
    <constraints nullable="false"/>
  </column>
  <column name="nom" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="mail" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="mdp" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="tel" type="VARCHAR(20)">
    <constraints nullable="false"/>
  </column>
</createTable>
<addPrimaryKey tableName="cuisinier" constraintName="cuisinier_pk" columnNames="id"/>

<createTable tableName="plat">
  <column name="id" type="INTEGER">
    <constraints nullable="false"/>
  </column>
  <column name="nom" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="details" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="image" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="date_publication" type="TIMESTAMP">
    <constraints nullable="false"/>
  </column>
  <column name="date_conditionnement" type="TIMESTAMP">
    <constraints nullable="false"/>
  </column>
  <column name="prix" type="FLOAT">
    <constraints nullable="false"/>
  </column>
</createTable>
<addPrimaryKey tableName="plat" constraintName="plat_pk" columnNames="id"/>

<createTable tableName="livreur">
  <column name="id" type="INTEGER">
    <constraints nullable="false"/>
  </column>
  <column name="nom" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="mail" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="mdp" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="tel" type="VARCHAR(20)">
    <constraints nullable="false"/>
  </column>
  <column name="statu" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="position" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="nb_plat" type="INTEGER">
    <constraints nullable="false"/>
  </column>
</createTable>
<addPrimaryKey tableName="livreur" constraintName="livreur_pk" columnNames="id"/>

<createTable tableName="client">
  <column name="id" type="INTEGER">
    <constraints nullable="false"/>
  </column>
  <column name="nom" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="mail" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="mdp" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="tel" type="VARCHAR(20)">
    <constraints nullable="false"/>
  </column>
</createTable>
<addPrimaryKey tableName="client" constraintName="client_pk" columnNames="id"/>

<createTable tableName="commande">
  <column name="id" type="INTEGER">
    <constraints nullable="false"/>
  </column>
  <column name="date_paiement" type="TIMESTAMP">
    <constraints nullable="false"/>
  </column>
  <column name="date_creation" type="TIMESTAMP">
    <constraints nullable="false"/>
  </column>
  <column name="date_livraison" type="TIMESTAMP">
    <constraints nullable="false"/>
  </column>
  <column name="prix" type="FLOAT">
    <constraints nullable="false"/>
  </column>
</createTable>
<addPrimaryKey tableName="commande" constraintName="commande_pk" columnNames="id"/>

<createTable tableName="commande_adresse">
  <column name="id" type="INTEGER">
    <constraints nullable="false"/>
  </column>
  <column name="adresse" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="ville" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="cp" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="pays" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
  <column name="info_livraison" type="VARCHAR(255)">
    <constraints nullable="false"/>
  </column>
</createTable>
<addPrimaryKey tableName="commande_adresse" constraintName="commande_adresse_pk" columnNames="id"/>

<addForeignKeyConstraint baseTableName="client" constraintName="client_adresse_client_fk" baseColumnNames="id" referencedTableName="client_adresse" referencedColumnNames="id"/>

<addForeignKeyConstraint baseTableName="client" constraintName="client_compte_fk" baseColumnNames="id" referencedTableName="compte" referencedColumnNames="id"/>

<addForeignKeyConstraint baseTableName="livreur" constraintName="compte_livreur_fk" baseColumnNames="id" referencedTableName="compte" referencedColumnNames="id"/>

<addForeignKeyConstraint baseTableName="cuisinier" constraintName="compte_cuisinier_fk" baseColumnNames="id" referencedTableName="compte" referencedColumnNames="id"/>

<addForeignKeyConstraint baseTableName="plat" constraintName="cuisinier_plat_fk" baseColumnNames="id" referencedTableName="cuisinier" referencedColumnNames="id"/>

<addForeignKeyConstraint baseTableName="commande" constraintName="plat_commande_fk" baseColumnNames="id" referencedTableName="plat" referencedColumnNames="id"/>

<addForeignKeyConstraint baseTableName="commande" constraintName="livreur_commande_fk" baseColumnNames="id" referencedTableName="livreur" referencedColumnNames="id"/>

<addForeignKeyConstraint baseTableName="commande" constraintName="client_commande_fk" baseColumnNames="id" referencedTableName="client" referencedColumnNames="id"/>

<addForeignKeyConstraint baseTableName="commande_adresse" constraintName="commande_commande_adresse_fk" baseColumnNames="id" referencedTableName="commande" referencedColumnNames="id"/>
</changeSet>
