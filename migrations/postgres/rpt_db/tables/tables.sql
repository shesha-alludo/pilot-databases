--liquibase formatted sql
--preconditions onFail:HALT onError:HALT

--changeset Tables:1 runOnChange:true stripComments:true
--labels: "Tables or GENERIC"

DROP TABLE IF EXISTS test.employee CASCADE;
CREATE TABLE test.employee(
	emp_id INT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender CHAR(1),
	dept_id INT NOT NULL
);