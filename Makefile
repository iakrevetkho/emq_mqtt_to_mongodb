PROJECT = emq_mqtt_to_mongo
PROJECT_DESCRIPTION = EMQ MQTT messages to MongoDB
PROJECT_VERSION = 0.0.3

DEPS = mongodb
dep_mongodb = git https://github.com/emqtt/mongodb-erlang v3.0.3

BUILD_DEPS = emqttd cuttlefish
dep_emqttd = git https://github.com/emqtt/emqttd master
dep_cuttlefish = git https://github.com/emqtt/cuttlefish

ERLC_OPTS += +debug_info
ERLC_OPTS += +'{parse_transform, lager_transform}'

NO_AUTOPATCH = cuttlefish

COVER = true

include erlang.mk

app:: rebar.config

app.config::
	./deps/cuttlefish/cuttlefish -l info -e etc/ -c etc/emq_mqtt_to_mongo.conf -i priv/emq_mqtt_to_mongo.schema -d data
