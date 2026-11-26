# OpenLMIS DHIS2 Integration Service
Service for integrating OpenLMIS implementation with DHIS2.

### Environment Variable Setup
This repository requires an environment file called `.env` in the root folder of the project, with required project settings and credentials. For a template environment file, you can use [this one](https://raw.githubusercontent.com/OpenLMIS/openlmis-ref-distro/master/settings-sample.env). e.g.
 ```shell
 curl -o .env -L https://raw.githubusercontent.com/OpenLMIS/openlmis-ref-distro/master/settings-sample.env
 ```

### Demo Data
Test data is included with this service as layers under `./src/main/resources/db/<layer>/`, with
one CSV file per table named `<schema>.<table>.csv`. Each layer is loaded by the Spring Profile of
the same name. Setting this profile may be done by setting the `spring.profiles.active` environment
variable.

| Profile | Contents |
|---|---|
| `base-data` | Setup that every layer needs. Loaded with every other data profile |
| `demo-data` | Data for demos, manual QA and UAT |
| `functional-test-data` | Fixed fixtures for automated tests. Cannot be combined with `demo-data` |
| `edge-case-data` | Unusual but valid records for exploratory testing |
| `performance-data` | Volume for performance tests |

`base-data` is loaded first, then the other active layers in the order of the table. A layer only
holds files for the tables it adds rows to. Rows of a layer may refer only to rows of their own
layer or of `base-data`, here and in the referencedata service, whose layers the data of this
service follows. Data is inserted into a freshly cleaned database, so a data profile must not be
combined with `production`. Files of a layer must be for tables listed in
`TestDataInitializer.TABLES`, in which the order of tables follows their foreign keys.
`functional-test-data` and `edge-case-data` have no files yet. Each layer folder has a README
describing its data.

When building locally from the development environment, you may run:

```shell
$ export spring_profiles_active=demo-data
$ gradle bootRun
```

### Build Deployment Image
Attached docker-compose.builder.yml allows automated docker image generation, run these two commands to 
create local image used together with selv-v3-distro

docker-compose -f docker-compose.builder.yml run builder \
docker-compose -f docker-compose.builder.yml build image
 
You need to insert Transifex token between these commands, if you don't have one you can generate new here:
https://www.transifex.com/user/settings/api/
