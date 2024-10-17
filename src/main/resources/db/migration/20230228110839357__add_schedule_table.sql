CREATE TABLE schedules (
    id UUID NOT NULL,
    periodEnumerator TEXT NOT NULL,
    timeOffset INT NOT NULL,
    serverId UUID NOT NULL,
    datasetId UUID NOT NULL,
    elementId UUID NOT NULL,

    CONSTRAINT schedule_pkey PRIMARY KEY (id),
    CONSTRAINT server_fkey FOREIGN KEY (serverId) REFERENCES servers(id),
    CONSTRAINT dataset_fkey FOREIGN KEY (datasetId) REFERENCES datasets(id),
    CONSTRAINT data_element_fkey FOREIGN KEY (elementId) REFERENCES data_elements(id)
);
