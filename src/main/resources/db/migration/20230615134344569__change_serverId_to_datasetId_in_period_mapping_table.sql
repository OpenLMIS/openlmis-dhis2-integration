DELETE FROM period_mappings;

ALTER TABLE period_mappings
DROP CONSTRAINT server_fkey,
ADD COLUMN datasetId UUID NOT NULL,
ADD CONSTRAINT dataset_fkey FOREIGN KEY (datasetId) REFERENCES datasets(id),
DROP COLUMN serverId;