CREATE TABLE events_history
(
  id SERIAL NOT NULL,
  type VARCHAR(50) NOT NULL,
  applianceId VARCHAR(50) NOT NULL,
  eventTime bigint,
  creationDate TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
  eventData VARCHAR(4000) NOT NULL,
  CONSTRAINT events_history_pk PRIMARY KEY(id)
);