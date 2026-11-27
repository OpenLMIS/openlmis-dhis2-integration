# Base Data for OpenLMIS DHIS2 Integration Service

This folder holds the base layer of this service's test data: the DHIS2 server, dataset, data
elements, schedules and shared facilities.

Each data profile (`base-data`, `demo-data`, `functional-test-data`, `edge-case-data`,
`performance-data`) loads `base-data` first, then the layer it names. Rows of a layer refer only to
rows of their own layer or of `base-data`, in this service and in referencedata, whose layers these
follow.

This service has no other layers yet.
