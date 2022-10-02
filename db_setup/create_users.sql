prompt>Dropping users
DROP USER sds_learner CASCADE;

prompt>Creating users
CREATE USER sds_learner IDENTIFIED BY sds_learner DEFAULT TABLESPACE users;

prompt>Granting privileges
GRANT ALL PRIVILEGES TO sds_learner;