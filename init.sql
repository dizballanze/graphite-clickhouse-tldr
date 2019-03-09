CREATE DATABASE IF NOT EXISTS graphite;

CREATE TABLE IF NOT EXISTS graphite.data (Path String, Value Float64, Time UInt32, Date Date, Timestamp UInt32) ENGINE = GraphiteMergeTree('graphite_rollup_with_percentiles') PARTITION BY Date ORDER BY (Path, Time) SETTINGS index_granularity = 8192;

CREATE TABLE IF NOT EXISTS graphite.metrics (Date Date, Level UInt32, Path String, Deleted UInt8, Version UInt32) ENGINE = ReplacingMergeTree(Version) PARTITION BY Date ORDER BY (Level, Path) SETTINGS index_granularity = 8192;
