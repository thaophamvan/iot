CREATE TABLE appliances_history
(
  id SERIAL NOT NULL,
  applianceId VARCHAR(50) NOT NULL,
  state INT NOT NULL,
  messageTime bigint,
  creationDate TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  CONSTRAINT appliances_history_pk PRIMARY KEY(id)
);