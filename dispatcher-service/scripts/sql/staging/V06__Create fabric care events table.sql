CREATE TABLE fabric_care_events
(
  id SERIAL NOT NULL,
  applianceId VARCHAR(50) NOT NULL,
  eventTime bigint,
  tankAReserve INT,
  tankBReserve INT,
  isProcessed BOOLEAN DEFAULT FALSE,
  creationDate TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  processedDate TIMESTAMP WITHOUT TIME ZONE NULL,
  CONSTRAINT fabric_care_events_pk PRIMARY KEY(id)
);