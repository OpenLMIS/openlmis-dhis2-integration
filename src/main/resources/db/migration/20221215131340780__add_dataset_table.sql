ALTER TABLE servers
ADD CONSTRAINT server_pkey PRIMARY KEY (id);

CREATE TABLE datasets (
    id UUID NOT NULL,
    name TEXT NOT NULL,
    dhisDatasetId TEXT NOT NULL,
    cronExpression TEXT NOT NULL,
    serverId UUID NOT NULL,

    CONSTRAINT dataset_pkey PRIMARY KEY (id),
    CONSTRAINT server_fkey FOREIGN KEY (serverId) REFERENCES servers(id)
);
