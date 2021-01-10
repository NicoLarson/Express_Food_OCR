
CREATE SEQUENCE public.niveau_bug_id_seq;

CREATE TABLE public.niveau_bug (
                id INTEGER NOT NULL DEFAULT nextval('public.niveau_bug_id_seq'),
                ordre INTEGER NOT NULL,
                libelle VARCHAR(100) NOT NULL,
                CONSTRAINT niveau_bug_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.niveau_bug_id_seq OWNED BY public.niveau_bug.id;

CREATE SEQUENCE public.utilisateur_id_seq;

CREATE TABLE public.utilisateur (
                id INTEGER NOT NULL DEFAULT nextval('public.utilisateur_id_seq'),
                nom VARCHAR(100) NOT NULL,
                prenom VARCHAR(100) NOT NULL,
                CONSTRAINT utilisateur_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.utilisateur.id;

CREATE TABLE public.historiaue_status (
                date DATE NOT NULL,
                id INTEGER NOT NULL
);


CREATE TABLE public.statut (
                id INTEGER NOT NULL,
                libelle VARCHAR(100) NOT NULL,
                CONSTRAINT statut_pk PRIMARY KEY (id)
);


CREATE TABLE public.projet (
                id INTEGER NOT NULL,
                nom VARCHAR(100) NOT NULL,
                date_creation TIMESTAMP NOT NULL,
                cloture BOOLEAN NOT NULL,
                CONSTRAINT projet_pk PRIMARY KEY (id)
);


CREATE TABLE public.version (
                projet_id INTEGER NOT NULL,
                numero VARCHAR(30) NOT NULL,
                CONSTRAINT version_pk PRIMARY KEY (projet_id, numero)
);


CREATE TABLE public.commentaire (
                id INTEGER NOT NULL,
                description VARCHAR(100) NOT NULL,
                utilisateur_id INTEGER NOT NULL,
                CONSTRAINT commentaire_pk PRIMARY KEY (id)
);


CREATE TABLE public.ticket (
                numero INTEGER NOT NULL,
                titre VARCHAR(300) NOT NULL,
                date TIMESTAMP NOT NULL,
                description VARCHAR(1000) NOT NULL,
                id INTEGER NOT NULL,
                CONSTRAINT ticket_pk PRIMARY KEY (numero)
);


CREATE TABLE public.ticket_associe (
                numero INTEGER NOT NULL,
                ticket_numero INTEGER NOT NULL,
                CONSTRAINT ticket_associe_pk PRIMARY KEY (numero, ticket_numero)
);


CREATE TABLE public.bug (
                ticket_numero INTEGER NOT NULL,
                niveau_bug_id INTEGER NOT NULL,
                CONSTRAINT bug_pk PRIMARY KEY (ticket_numero, niveau_bug_id)
);


CREATE TABLE public.evolution (
                ticket_numero INTEGER NOT NULL,
                priorite INTEGER NOT NULL,
                CONSTRAINT evolution_pk PRIMARY KEY (ticket_numero)
);


ALTER TABLE public.bug ADD CONSTRAINT niveau_bug_bug_fk
FOREIGN KEY (niveau_bug_id)
REFERENCES public.niveau_bug (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.commentaire ADD CONSTRAINT utilisateur_commentaire_fk
FOREIGN KEY (utilisateur_id)
REFERENCES public.utilisateur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.projet ADD CONSTRAINT utilisateur_projet_fk
FOREIGN KEY (id)
REFERENCES public.utilisateur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.historiaue_status ADD CONSTRAINT utilisateur_historiaue_status_fk
FOREIGN KEY (id)
REFERENCES public.utilisateur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ticket ADD CONSTRAINT utilisateur_ticket_fk
FOREIGN KEY (id)
REFERENCES public.utilisateur (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*
Warning: Relationship has no columns to map:
*/
ALTER TABLE public.statut ADD CONSTRAINT historiaue_status_statut_fk
FOREIGN KEY ()
REFERENCES public.historiaue_status ()
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*
Warning: Relationship has no columns to map:
*/
ALTER TABLE public.ticket ADD CONSTRAINT historiaue_status_ticket_fk
FOREIGN KEY ()
REFERENCES public.historiaue_status ()
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*
Warning: Relationship has no columns to map:
*/
ALTER TABLE public.commentaire ADD CONSTRAINT historiaue_status_commentaire_fk
FOREIGN KEY ()
REFERENCES public.historiaue_status ()
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ticket ADD CONSTRAINT statut_ticket_fk
FOREIGN KEY (id)
REFERENCES public.statut (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.version ADD CONSTRAINT projet_version_fk
FOREIGN KEY (projet_id)
REFERENCES public.projet (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ticket ADD CONSTRAINT projet_ticket_fk
FOREIGN KEY (id)
REFERENCES public.projet (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ticket ADD CONSTRAINT commentaire_ticket_fk
FOREIGN KEY (id)
REFERENCES public.commentaire (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.evolution ADD CONSTRAINT ticket_evolution_fk
FOREIGN KEY (ticket_numero)
REFERENCES public.ticket (numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.bug ADD CONSTRAINT ticket_bug_fk
FOREIGN KEY (ticket_numero)
REFERENCES public.ticket (numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ticket_associe ADD CONSTRAINT ticket_ticket_associe_fk
FOREIGN KEY (numero)
REFERENCES public.ticket (numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ticket_associe ADD CONSTRAINT ticket_ticket_associe_fk1
FOREIGN KEY (ticket_numero)
REFERENCES public.ticket (numero)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
