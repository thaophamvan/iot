CREATE TABLE user_selections
(
  id SERIAL NOT NULL,
  userEmail varchar(255) NOT NULL,
  applianceId varchar(50) NOT NULL,
  tankASelection int,
  tankBSelection int,
  CONSTRAINT user_selections_pk PRIMARY KEY(id),
  CONSTRAINT user_selections_unique UNIQUE (userEmail, applianceId)
);