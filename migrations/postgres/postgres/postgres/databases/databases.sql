--liquibase formatted sql
--preconditions onFail:HALT onError:HALT

--changeset Databases:0 runOnChange:true stripComments:true runInTransaction:false
--labels: "Databases or GENERIC"

DROP DATABASE HR;
DROP DATABASE FINANCE;
DROP DATABASE OPERATIONS;

--changeset Databases:1 runOnChange:true stripComments:true runInTransaction:false
--labels: "Databases or GENERIC"

CREATE DATABASE HR;
CREATE DATABASE FINANCE;

--changeset Databases:2 runOnChange:true stripComments:true runInTransaction:false
--labels: "Databases or GENERIC"

CREATE DATABASE OPERATIONS;

