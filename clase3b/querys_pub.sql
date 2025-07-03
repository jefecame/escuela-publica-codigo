-- Base de Datos
CREATE DATABASE pub;

-- TABLAS ======================================

CREATE TABLE "Municipios" (
    "cve_municipio" SERIAL NOT NULL,
    "nombre_municipio" VARCHAR NOT NULL,
    PRIMARY KEY ("cve_municipio")
);

CREATE TABLE "Localidades" (
    "cve_localidad" SERIAL NOT NULL,
    "nombre_localidad" VARCHAR NOT NULL,
    "cve_municipio" INTEGER NOT NULL,
    PRIMARY KEY ("cve_localidad")
);

CREATE TABLE "Dependencias" (
    "cve_dependencia" VARCHAR NOT NULL,
    "nombre_dependencia" VARCHAR NOT NULL,
    PRIMARY KEY ("cve_dependencia")
);

CREATE TABLE "Personas" (
    "id_persona" VARCHAR NOT NULL,
    "nombre" VARCHAR NOT NULL,
    "apellido_1" VARCHAR NOT NULL,
    "apellido_2" VARCHAR NOT NULL,
    "fecha_nacimiento" DATE NOT NULL,
    "lugar_nacimiento" VARCHAR NOT NULL,
    "sexo" CHAR	 NOT NULL,
    "rfc" VARCHAR,
    "curp" VARCHAR,
    "tipo_persona" CHAR NOT NULL,
    "cve_localidad" INTEGER NOT NULL,
    PRIMARY KEY ("id_persona")
);

CREATE TABLE "Programas" (
    "cve_programa" VARCHAR NOT NULL,
    "nombre_programa" VARCHAR NOT NULL,
    "tipo_programa" VARCHAR NOT NULL,
    "ejercicio" VARCHAR NOT NULL,
    "periodo" VARCHAR NOT NULL,
    "clasificador" VARCHAR NOT NULL,
    "tipo_sector" VARCHAR NOT NULL,
    "fuente_financiamiento" VARCHAR NOT NULL,
    "cve_dependencia" VARCHAR NOT NULL,
    PRIMARY KEY ("cve_programa")
);

CREATE TABLE "Apoyos" (
    "folio" VARCHAR NOT NULL,
    "consecutivo" SERIAL NOT NULL,
    "tipo_apoyo" VARCHAR NOT NULL,
    "concepto_apoyo" VARCHAR NOT NULL,
    "cantidad" INTEGER NOT NULL,
    "monto_apoyo" DECIMAL NOT NULL,
    "id_persona" VARCHAR NOT NULL,
    "cve_programa" VARCHAR NOT NULL,
    PRIMARY KEY ("folio")
);

-- Llaves foráneas =============================

ALTER TABLE "Apoyos"
ADD CONSTRAINT "fk_Apoyos_cve_programa_Programas_cve_programa" 
FOREIGN KEY("cve_programa") REFERENCES "Programas"("cve_programa");

ALTER TABLE "Apoyos"
ADD CONSTRAINT "fk_Apoyos_id_persona_Personas_id_persona" 
FOREIGN KEY("id_persona") REFERENCES "Personas"("id_persona");

ALTER TABLE "Localidades"
ADD CONSTRAINT "fk_Localidades_cve_municipio_Municipios_cve_municipio" 
FOREIGN KEY("cve_municipio") REFERENCES "Municipios"("cve_municipio");

ALTER TABLE "Personas"
ADD CONSTRAINT "fk_Personas_cve_localidad_Localidades_cve_localidad" 
FOREIGN KEY("cve_localidad") REFERENCES "Localidades"("cve_localidad");

ALTER TABLE "Programas"
ADD CONSTRAINT "fk_Programas_cve_dependencia_Dependencias_cve_dependencia" 
FOREIGN KEY("cve_dependencia") REFERENCES "Dependencias"("cve_dependencia");
