#####################################################
# The following values are provided by Confluent's
# release automation process.  The values in these
# names will be adopted in scripts and expressions
# over time to construct other
# values required by this repository
#####################################################
CONFLUENT=7.4.1
CONFLUENT_DOCKER_TAG=7.4.1
CONFLUENT_SHORT=7.4
CONFLUENT_PREVIOUS=""
CONFLUENT_RELEASE_TAG_OR_BRANCH=7.4.1-post
CONFLUENT_MAJOR=7
CONFLUENT_MINOR=4
CONFLUENT_PATCH=1
#####################################################

CP_VERSION_FULL="$CONFLUENT_MAJOR.$CONFLUENT_MINOR.$CONFLUENT_PATCH"

# REPOSITORY - repository (probably) for Docker images
# The '/' which separates the REPOSITORY from the image name is not required here
export REPOSITORY=${REPOSITORY:-confluentinc}

# CONNECTOR_VERSION - connector version
export CONNECTOR_VERSION=${CONNECTOR_VERSION:-$CONFLUENT}

# Control Center and ksqlDB server must both be HTTP or both be HTTPS; mixed modes are not supported
# C3_KSQLDB_HTTPS=false: set Control Center and ksqlDB server to use HTTP (default)
# C3_KSQLDB_HTTPS=true : set Control Center and ksqlDB server to use HTTPS
export C3_KSQLDB_HTTPS=${C3_KSQLDB_HTTPS:-false}
if [[ "$C3_KSQLDB_HTTPS" == "false" ]]; then
  export CONTROL_CENTER_KSQL_WIKIPEDIA_URL="http://ksqldb-server:8088"
  export CONTROL_CENTER_KSQL_WIKIPEDIA_ADVERTISED_URL="http://localhost:8088"
  C3URL=http://localhost:9021
else
  export CONTROL_CENTER_KSQL_WIKIPEDIA_URL="https://ksqldb-server:8089"
  export CONTROL_CENTER_KSQL_WIKIPEDIA_ADVERTISED_URL="https://localhost:8089"
  C3URL=https://localhost:9022
fi
