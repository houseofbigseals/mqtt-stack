SELECT create_hypertable('metrics', 'time', if_not_exists := true);

ALTER TABLE metrics
    SET (timescaledb.compress);

SELECT add_compression_policy('metrics', INTERVAL '7 days', if_not_exists := true);
