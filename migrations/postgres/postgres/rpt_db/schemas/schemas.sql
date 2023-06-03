--liquibase formatted sql
--preconditions onFail:HALT onError:HALT

--changeset Schemas:1 runOnChange:true stripComments:true runInTransaction:false
--labels: "Schemas or GENERIC"

CREATE schema IF NOT EXISTS test;