ALTER TABLE data_elements
DROP CONSTRAINT data_elements_name_key;

ALTER TABLE data_elements
ADD CONSTRAINT data_element_name_key UNIQUE(name, datasetid);

ALTER TABLE servers
ADD CONSTRAINT server_name_key UNIQUE(name);