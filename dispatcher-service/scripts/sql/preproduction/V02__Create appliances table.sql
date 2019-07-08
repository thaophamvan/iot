CREATE TABLE appliances
(
  id SERIAL NOT NULL,
  applianceId VARCHAR(50) NOT NULL,
  state INT NOT NULL,
  CONSTRAINT appliances_pk PRIMARY KEY(id),
  CONSTRAINT appliances_unique UNIQUE (applianceId)
);