CREATE TABLE user_selections_history
(
  id SERIAL NOT NULL,
  userEmail varchar(255) NOT NULL,
  applianceId varchar(50) NOT NULL,
  tankASelection int,
  tankBSelection int,
  messageTime bigint,
  creationDate TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  CONSTRAINT user_selections_history_pk PRIMARY KEY(id)
);