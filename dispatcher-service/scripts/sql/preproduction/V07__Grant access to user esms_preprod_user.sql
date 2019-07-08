GRANT USAGE ON SCHEMA public TO esms_preprod_user;

GRANT SELECT ON appliances TO esms_preprod_user;
GRANT INSERT ON appliances TO esms_preprod_user;
GRANT UPDATE ON appliances TO esms_preprod_user;
GRANT USAGE, SELECT ON SEQUENCE appliances_id_seq TO esms_preprod_user;

GRANT SELECT ON appliances_history TO esms_preprod_user;
GRANT INSERT ON appliances_history TO esms_preprod_user;
GRANT DELETE ON appliances_history TO esms_preprod_user;
GRANT USAGE, SELECT ON SEQUENCE appliances_history_id_seq TO esms_preprod_user;

GRANT SELECT ON events_history TO esms_preprod_user;
GRANT INSERT ON events_history TO esms_preprod_user;
GRANT DELETE ON events_history TO esms_preprod_user;
GRANT USAGE, SELECT ON SEQUENCE events_history_id_seq TO esms_preprod_user;

GRANT SELECT ON fabric_care_events TO esms_preprod_user;
GRANT INSERT ON fabric_care_events TO esms_preprod_user;
GRANT UPDATE ON fabric_care_events TO esms_preprod_user;
GRANT DELETE ON fabric_care_events TO esms_preprod_user;
GRANT USAGE, SELECT ON SEQUENCE fabric_care_events_id_seq TO esms_preprod_user;

GRANT SELECT ON user_selections TO esms_preprod_user;
GRANT INSERT ON user_selections TO esms_preprod_user;
GRANT UPDATE ON user_selections TO esms_preprod_user;
GRANT USAGE, SELECT ON SEQUENCE user_selections_id_seq TO esms_preprod_user;

GRANT SELECT ON user_selections_history TO esms_preprod_user;
GRANT INSERT ON user_selections_history TO esms_preprod_user;
GRANT DELETE ON user_selections_history TO esms_preprod_user;
GRANT USAGE, SELECT ON SEQUENCE user_selections_history_id_seq TO esms_preprod_user;
