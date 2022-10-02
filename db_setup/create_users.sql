prompt>Dropping users
DROP USER sportdatasci CASCADE;

prompt>Creating users
CREATE USER sportdatasci IDENTIFIED BY sportdatasci DEFAULT TABLESPACE users;

prompt>Granting privileges
GRANT ALL PRIVILEGES TO sportdatasci;
